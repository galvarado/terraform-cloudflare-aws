provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {}

data "cloudflare_zone" "main" {
  name = var.cloudflare_zone
}

data "terraform_remote_state" "state_from_001_aws" {
  backend = "local"
  config = {
    path = "../001-aws/terraform.tfstate"
  }
}

module "dns" {
  source  = "../../../modules/dns"
  route53_zone_id = data.terraform_remote_state.state_from_001_aws.outputs.aws_route53_zone_id
  cloudflare_zone_id = data.cloudflare_zone.main.zone_id
}
