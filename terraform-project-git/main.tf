module "storage" {
  source      = "git::https://github.com/rogerramossilva/terraform-aws-storage.git?ref=v1.0.1"
  bucket_name = "empresa-storage-rogerio-2026"
}
