variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    ap-south-1 = "ami-5b673c34"
  }
}

resource "aws_instance" "example" {
  #ami           = var.AMIS[var.AWS_REGION]
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"  
}
