# easy-static-s3-website
Terraform code to deploy //domain.com// static website on s3, with route53, and logging and things.

# TODO:
1. Edit the PUBLIC-bucket-policy.json file, make sure to include your domain name.
        "Resource":["arn:aws:s3:::YOURDOMAINNAME.COM/*"
2. Edit vars.tf if you want, the script should ask you for the info anyways.
3. Edit tarraform.tfvars with your aws access and secret keys.

This TF Script does the following:

+ create s3 bucket www.domain.com
+ creates s3 bucket domain.com
+ creates s3 bucket log.domain.com (for logging!)
+ Set domain.com bucket to static website hosting
+ Set www.domain.com bucket to url fwd to domain.com
+ Set domain.com logging to log.domain.com bucket 
+ set log.domain.com bucket policy and 90day lifecycle.

+ add bucket policy to domain.com (YOU NEED TO EDIT THE POLICY FIRST)

+ Create route53 hosted zone
+ create alias record from domain.com to s3bucket url
+ create alias record for www.domain.com to domain.com
