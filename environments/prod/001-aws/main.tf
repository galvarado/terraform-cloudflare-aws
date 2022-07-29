provider "aws" {
  region = var.aws_region
}

module "app" {
  source = "../../../modules/app"
  dns_internal_ops_domain = var.dns_internal_ops_domain
}