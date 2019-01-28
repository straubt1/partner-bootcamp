provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

module "networking" {
  source       = "./network"
  name         = "${local.env_random}"
  aws_region   = "${var.aws_region}"
  aws_zone     = "${var.aws_zone}"
  vpc_cidr     = "${var.vpc_cidr}"
  subnet_cidrs = "${var.subnet_cidrs}"
}

module "consul-a" {
  source            = "./consul"
  name              = "${local.env_random}_A"
  instance_count    = "${var.consul_count}"
  aws_region        = "${var.aws_region}"
  aws_zone          = "${var.aws_zone}"
  subnet_id         = "${module.networking.subnets[0]}"
  security_group_id = "${module.networking.security_group}"
  profile_id        = "${aws_iam_instance_profile.vault-kms-unseal.id}"
  ami_id            = "${data.aws_ami.ubuntu.id}"
  key_pair          = "${aws_key_pair.main.id}"
}

module "vault-a" {
  source            = "./vault"
  name              = "${local.env_random}_A"
  instance_count    = "${var.vault_count}"
  aws_region        = "${var.aws_region}"
  aws_zone          = "${var.aws_zone}"
  subnet_id         = "${module.networking.subnets[0]}"
  security_group_id = "${module.networking.security_group}"
  profile_id        = "${aws_iam_instance_profile.vault-kms-unseal.id}"
  ami_id            = "${data.aws_ami.ubuntu.id}"
  key_pair          = "${aws_key_pair.main.id}"
}


module "consul-b" {
  source            = "./consul"
  name              = "${local.env_random}_B"
  instance_count    = "${var.consul_count}"
  aws_region        = "${var.aws_region}"
  aws_zone          = "${var.aws_zone}"
  subnet_id         = "${module.networking.subnets[0]}"
  security_group_id = "${module.networking.security_group}"
  profile_id        = "${aws_iam_instance_profile.vault-kms-unseal.id}"
  ami_id            = "${data.aws_ami.ubuntu.id}"
  key_pair          = "${aws_key_pair.main.id}"
}

module "vault-b" {
  source            = "./vault"
  name              = "${local.env_random}_B"
  instance_count    = "${var.vault_count}"
  aws_region        = "${var.aws_region}"
  aws_zone          = "${var.aws_zone}"
  subnet_id         = "${module.networking.subnets[0]}"
  security_group_id = "${module.networking.security_group}"
  profile_id        = "${aws_iam_instance_profile.vault-kms-unseal.id}"
  ami_id            = "${data.aws_ami.ubuntu.id}"
  key_pair          = "${aws_key_pair.main.id}"
}

resource "aws_kms_key" "vault" {
  description             = "Vault unseal key"
  deletion_window_in_days = 10

  tags {
    Name = "${local.env_random}"
  }
}
