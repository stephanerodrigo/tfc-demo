provider "aws" {
  region = var.aws_region
  version = "~> 2.70.0"
}

#Basic Example Using AMI Lookup
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "vpc_sro" {
  tags = {
    "Env" = "SRO_TST"
  }
}

data "aws_availability_zones" "available" {}


data "aws_subnet" "subnet_sro" {
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id = data.aws_vpc.vpc_sro.id
}

data "aws_security_group" "sg-sro"{
  vpc_id = data.aws_vpc.vpc_sro.id

  tags = {
    Name = "SG_SRO_TST"
  }
}

resource "aws_instance" "tfc-demo" {
  count         = var.EC2_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  availability_zone = var.availability_zone
  subnet_id = data.aws_subnet.subnet_sro.id
  security_groups = [data.aws_security_group.sg-sro.id]

  tags = {
    Name = "tfc-demo"
  }
}
