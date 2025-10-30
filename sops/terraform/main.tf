data "sops_file" "demo-secret" {
  source_file = "/tmp/secrets.yaml"
}

output "password" {
  # Access the password variable from the map
  value     = data.sops_file.demo-secret.data["secure_password"]
  sensitive = true
}
