variable "name" {}
variable "aws_region" {}
variable "aws_zone" {}
variable "vpc_cidr" {}

variable "subnet_cidrs" {
  type = "list"
}

locals {
  name = "${var.name}"
}
