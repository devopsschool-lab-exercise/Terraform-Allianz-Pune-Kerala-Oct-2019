resource "aws_instance" "web" {
 ami           = "ami-5b673c34"
 instance_type = "t2.micro"
 vpc_id = "public.vpc_id"
 subnet_id = "public.subnet_ids"
 availability_zone = "public.availability_zone"
 tags = {
   Name = "Junaid"
 }
}
module "vpc" {
 source  = "terraform-aws-modules/vpc/aws"
 version = "2.17.0"
 # insert the 8 required variables here
 name = "Junaid_VPC"
 cidr = "10.0.0.0/16"
 azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
 private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
 public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
 enable_nat_gateway = true
 enable_vpn_gateway = true
 tags = {
   Terraform = "true"
   Environment = "dev"
 }
}
output "instance_public_ip_addr" {
   value = aws_instance.web.public_ip
}
output "instance_private_ip_addr" {
 value = aws_instance.web.private_ip
}
