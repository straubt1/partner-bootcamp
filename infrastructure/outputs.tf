output "consul-a_public_ips" {
  value = "${module.consul-a.public_ips}"
}

output "vault-a_public_ips" {
  value = "${module.vault-a.public_ips}"
}

output "consul-b_public_ips" {
  value = "${module.consul-b.public_ips}"
}

output "vault-b_public_ips" {
  value = "${module.vault-b.public_ips}"
}

output "kms_key_id" {
  value = "${aws_kms_key.vault.id}"
}