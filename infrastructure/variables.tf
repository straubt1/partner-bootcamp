variable "aws_region" {
  default = "us-east-1"
}

variable "aws_zone" {
  default = "us-east-1a"
}

variable "vault_url" {
  default = "https://releases.hashicorp.com/vault/1.0.0/vault_1.0.0_linux_amd64.zip"
}

variable "vpc_cidr" {
  type        = "string"
  description = "CIDR of the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type        = "list"
  description = "CIDR of the VPC subnets"

  default = [
    "10.0.0.0/16",
  ]

  // "10.0.1.0/16",
  // "10.0.2.0/16",
}

variable "consul_count" {
  default = 5
}

variable "vault_count" {
  default = 3
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "acme_reg_key_pem" {}
variable "DNS_CLIENT_ID" {}
variable "DNS_CLIENT_SECRET" {}
variable "DNS_SUBSCRIPTION_ID" {}
variable "DNS_TENANT_ID" {}

locals {
  env_random  = "tstraub_${random_pet.env.id}"
  dns_rg_name = "csg-terraform-enterprise"
  dns_domain  = "tstraub.com"
}

resource "random_pet" "env" {
  length    = 2
  separator = "_"
}
