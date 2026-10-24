resource "local_file" "application_config" {

  filename = "application.conf"

  content = <<EOF
database_user=admin
database_password=${data.vault_kv_secret_v2.app.data["password"]}
EOF

}