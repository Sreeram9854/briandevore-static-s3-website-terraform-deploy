## Bucket for domain.com
resource "aws_s3_bucket" "primary_s3bucket" {
  bucket = var.SITENAME
  acl    = "public-read"
  policy = file("PUBLIC-bucket-policy.json")
  force_destroy = true
 # setup static website
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  logging {
    target_bucket = aws_s3_bucket.logs_s3bucket.id
  }
}
## Bucket for www.domain.com
resource "aws_s3_bucket" "www_s3bucket" {
  bucket = "www.${var.SITENAME}"
  acl    = "public-read"
  depends_on = [aws_s3_bucket.primary_s3bucket]
  force_destroy = true
 # setup www.domain.com static website
 website {
   redirect_all_requests_to = var.SITENAME
 }
}
## bucket for site logs
resource "aws_s3_bucket" "logs_s3bucket" {
  bucket = "logs.${var.SITENAME}"
  acl    = "log-delivery-write"
  # force destroy bucket, in case logs are present.
  force_destroy = true
# setup lifecycle management for logs.
lifecycle_rule {
  id      = "log"
  enabled = true
    expiration {
      days = 90
      }
  }
}
