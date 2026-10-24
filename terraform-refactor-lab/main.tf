module "storage" {
  source = "./modules/storage"
  bucket_name = "empresa-storage-lab-001-rogerio"
}


moved {
  from = aws_s3_bucket.app_storage
  to = module.storage.aws_s3_bucket.app_storage
}
