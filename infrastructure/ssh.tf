resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

resource "local_file" "ssh-public" {
  content  = "${tls_private_key.ssh.public_key_openssh}"
  filename = "../configuration/secrets/id_rsa.pub"
}

resource "local_file" "ssh-private" {
  content  = "${tls_private_key.ssh.private_key_pem}"
  filename = "../configuration/secrets/id_rsa.pem"
}

resource "aws_key_pair" "main" {
  key_name   = "vault-kms-unseal-${local.env_random}"
  public_key = "${tls_private_key.ssh.public_key_openssh}"
}
