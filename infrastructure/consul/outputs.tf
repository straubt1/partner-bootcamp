output "public_ips" {
  value = "${aws_instance.module.*.public_ip}"
}
