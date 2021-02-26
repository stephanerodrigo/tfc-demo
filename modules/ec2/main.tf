resource "aws_instance" "ec2_instance" {
  count         = var.EC2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  source_dest_check = var.source_dest_check
  subnet_id = length(var.network_interface) > 0 ? null : element(
    distinct(compact(concat([var.subnet_id], var.subnet_ids))),
    count.index,
  )
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", false)
    }
  }
  tags = merge(
    {
      "Name" = var.EC2_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.tags,
  )
}
