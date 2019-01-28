provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "acme_certificate" "ssl" {
  account_key_pem = "${var.acme_reg_key_pem}"
  common_name     = "*.bootcamp.${local.dns_domain}"

  // min_days_remaining = 60

  dns_challenge {
    provider = "azure"

    config {
      AZURE_RESOURCE_GROUP = "${local.dns_rg_name}"

      AZURE_CLIENT_ID       = "${var.DNS_CLIENT_ID}"
      AZURE_CLIENT_SECRET   = "${var.DNS_CLIENT_SECRET}"
      AZURE_SUBSCRIPTION_ID = "${var.DNS_SUBSCRIPTION_ID}"
      AZURE_TENANT_ID       = "${var.DNS_TENANT_ID}"
    }
  }
}

resource "local_file" "ssl-crt" {
  content  = "${acme_certificate.ssl.certificate_pem}"
  filename = "../configuration/secrets/server.crt"
}

resource "local_file" "ssl-key" {
  content  = "${acme_certificate.ssl.private_key_pem}"
  filename = "../configuration/secrets/server.key"
}
