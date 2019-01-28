resource "azurerm_dns_a_record" "consul-a" {
  resource_group_name = "${local.dns_rg_name}"
  zone_name           = "${local.dns_domain}"
  count               = "${var.consul_count}"
  name                = "consul-a${count.index}.bootcamp"
  ttl                 = 10
  records             = ["${module.consul-a.public_ips[count.index]}"]
}

resource "azurerm_dns_a_record" "vault-a" {
  resource_group_name = "${local.dns_rg_name}"
  zone_name           = "${local.dns_domain}"
  count               = "${var.vault_count}"
  name                = "vault-a${count.index}.bootcamp"
  ttl                 = 10
  records             = ["${module.vault-a.public_ips[count.index]}"]
}

resource "azurerm_dns_a_record" "consul-b" {
  resource_group_name = "${local.dns_rg_name}"
  zone_name           = "${local.dns_domain}"
  count               = "${var.consul_count}"
  name                = "consul-b${count.index}.bootcamp"
  ttl                 = 10
  records             = ["${module.consul-b.public_ips[count.index]}"]
}

resource "azurerm_dns_a_record" "vault-b" {
  resource_group_name = "${local.dns_rg_name}"
  zone_name           = "${local.dns_domain}"
  count               = "${var.vault_count}"
  name                = "vault-b${count.index}.bootcamp"
  ttl                 = 10
  records             = ["${module.vault-b.public_ips[count.index]}"]
}

// output "consul-a-dns"{
//   value = "${azurerm_dns_a_record.consul-a.*.records}"
// }
// output "vault-a-dns"{
//   value = "${azurerm_dns_a_record.vault-a.*.records}"
// }
