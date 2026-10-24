resource "google_storage_bucket" "terraform_state" {
  name     = var.bucket_name
  location = "US"

  storage_class = "STANDARD"

  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
