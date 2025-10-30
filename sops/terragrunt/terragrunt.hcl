locals {
  secret = yamldecode(sops_decrypt_file("/tmp/secrets.yaml"))
}

inputs = local.secret

terraform {
    source = "main.tf"
}
