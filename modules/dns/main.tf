
data "aws_route53_zone" "selected" {
  zone_id         = var.route53_zone_id
  private_zone = false
}



resource "cloudflare_record" "ns" {
  count = length(data.aws_route53_zone.selected.name_servers)
  zone_id = var.cloudflare_zone_id
  name    = "dev.ops"
  value   = data.aws_route53_zone.selected.name_servers[count.index]
  type    = "NS"
  ttl     = 1
}

