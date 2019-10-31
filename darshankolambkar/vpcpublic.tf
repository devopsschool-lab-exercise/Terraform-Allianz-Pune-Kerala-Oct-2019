module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Darshan-VPC"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}