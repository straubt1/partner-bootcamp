variable "name" {}
variable "aws_region" {}
variable "aws_zone" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "profile_id" {}
variable "ami_id" {}
variable "key_pair" {}

variable "instance_size" {
  default = "t2.micro"
}

variable "instance_count" {
  default = 2
}

locals {
  name = "${var.name}-vault"
}
