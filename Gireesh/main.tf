module "vpc" {
  source  = "JamesWoolfenden/vpc/aws"
  version = "0.1.32"
  # insert the 4 required variables here
}

module "ec2"{
    source = "./ec2create"

   # my_subnet = "${element(module.vpc.public_subnets,0)}"    
    my_subnet = "${module.vpc.public_subnets}"   
        }

# Configure the AWS Provider
provider "aws" {
   region  = "us-east-1"
  access_key = ""
  secret_key = ""
}
