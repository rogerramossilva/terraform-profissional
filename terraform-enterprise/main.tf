module "networking" {
  source = "./modules/networking"

  name_prefix         = local.name_prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "storage" {
  source = "./modules/storage"

  name_prefix = local.name_prefix
}

module "iam" {
  source = "./modules/iam"

  name_prefix = local.name_prefix
  bucket_arn  = module.storage.bucket_arn
}

module "compute" {
  source = "./modules/compute"

  name_prefix      = local.name_prefix
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  vpc_id           = module.networking.vpc_id
  subnet_id        = module.networking.public_subnet_id
  instance_profile = module.iam.instance_profile_name
}
