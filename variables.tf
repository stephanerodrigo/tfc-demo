variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "EC2_count" {
  description = "Number of EC2 to launch"
  default = "1"
}

variable "availability_zone" {
  default = "eu-west-1a"
}
