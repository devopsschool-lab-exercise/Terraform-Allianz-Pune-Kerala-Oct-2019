resource "aws_instance" "web" {
  ami           = "ami-5b673c34"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
