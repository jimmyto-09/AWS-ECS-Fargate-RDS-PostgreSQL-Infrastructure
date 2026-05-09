resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "jimmyto09.site"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
