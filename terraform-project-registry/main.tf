module "storage" {
  source  = "app.terraform.io/linuxforce/storage/aws"
  version = "1.0.0"
  bucket_name = "empresa-storage-rogerio-2026"
}