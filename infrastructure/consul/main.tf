resource "aws_instance" "module" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_size}"
  count         = "${var.instance_count}"
  subnet_id     = "${var.subnet_id}"
  key_name      = "${var.key_pair}"

  security_groups = ["${var.security_group_id}"]

  associate_public_ip_address = true
  ebs_optimized               = false
  iam_instance_profile        = "${var.profile_id}"

  tags {
    Name = "${local.name}-${count.index}"
  }

user_data = "${data.template_file.vault.rendered}"
  // TODO: why is this broken??
  lifecycle {
    ignore_changes = [
      "security_groups",
    ]
  }
}

data "template_file" "vault" {
  template = "${file("${path.module}/userdata.tpl")}"

  vars = {
  }
}
