data "vault_kv_secret_v2" "app" {
  mount = "secret"
  name  = "application"
}
