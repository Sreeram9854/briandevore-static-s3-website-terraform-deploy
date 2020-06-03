## Create the hosted zone
resource "aws_route53_zone" "primary_domain" {
  name = var.SITENAME
  depends_on = [aws_s3_bucket.primary_s3bucket]
}

## Create the Alias Records.
# domain.com to s3 bucket
resource "aws_route53_record" "domain" {
  zone_id = aws_route53_zone.primary_domain.zone_id
  name    = var.SITENAME
  type    = "A"
  depends_on = [aws_route53_zone.primary_domain]
  alias {
    #name = "${var.SITENAME}.s3-website.${var.AWS_REGION}.amazonaws.com"
    #name = aws_s3_bucket.primary_s3bucket.website_domain
    name                   = aws_s3_bucket.primary_s3bucket.website_domain
    zone_id                = aws_s3_bucket.primary_s3bucket.hosted_zone_id
    evaluate_target_health = true
    #zone_id = aws_route53_zone.primary_domain.zone_id
  }
}
# www.domain.com to domain.com
resource "aws_route53_record" "www_domain" {
  zone_id = aws_route53_zone.primary_domain.zone_id
  name    = "www.${var.SITENAME}"
  type    = "A"
  depends_on = [aws_route53_zone.primary_domain]
  alias {
    #name = "www.${var.SITENAME}.s3-website.${var.AWS_REGION}.amazonaws.com"
    #name = aws_s3_bucket.www_s3bucket.website_domain
    name                   = aws_s3_bucket.www_s3bucket.website_domain
    zone_id                = aws_s3_bucket.www_s3bucket.hosted_zone_id
    evaluate_target_health = true
    #zone_id = aws_route53_zone.primary_domain.zone_id
  }
}
## Create the MX Records
#resource "aws_route53_record" "mail" {
#  zone_id = aws_route53_zone.primary_domain.zone_id
#  name    = var.SITENAME
#  type    = "MX"
#  depends_on = [aws_route53_zone.primary_domain]
#  ttl = "300"
#  records = ["10 mx.zoho.com",
#           "20 mx2.zoho.com",
#           "50 mx3.zoho.com"]
#           ttl = "300"
#
# MX Records for Google.com
#
#records = ["1 aspmx.l.google.com",
#         "5 alt1.aspmx.l.google.com",
#         "5 alt2.aspmx.l.google.com",
#         "10 aspmx1.googlemail.com",
#         "10 aspmx2.googlemail.com"]
#
#}
