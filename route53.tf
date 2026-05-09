resource "aws_route53_zone" "main" {
  name = "jimmyto09.site"
}

output "route53_nameservers" {
  value = aws_route53_zone.main.name_servers
}