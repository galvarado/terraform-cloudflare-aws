resource "aws_route53_zone" "main" {
  name = var.dns_internal_ops_domain
}