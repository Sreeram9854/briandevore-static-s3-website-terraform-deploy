variable "AWS_ACCESS_KEY" {
    description = "What is your Access Key? Add this to the terraform.tfvsrs file."
}
variable "AWS_SECRET_KEY" {
    description = "What is your Secret Key? Add this to the terraform.tfvars file."
}

variable "AWS_REGION" {
  description = "What region do you want your bucket/static site created in?"
  default = "us-east-2"
}

variable "SITENAME" {
  description = "yourdomainname.com"
}
