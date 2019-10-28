resource "aws_instance" "ShoaibTerraformEC2" {
  ami           = "ami-5b673c34"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
