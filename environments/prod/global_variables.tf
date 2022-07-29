variable "aws_region" {
  default     = "eu-west-1"
  description = "AWS region all resources will be created under"
}

variable "cloudflare_zone" {
  default = "lastbit.dev"
}

variable "dns_internal_ops_domain" {
  default = "dev.ops.lastbit.dev"
}