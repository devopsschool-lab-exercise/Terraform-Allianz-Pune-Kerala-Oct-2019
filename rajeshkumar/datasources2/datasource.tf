data "aws_ami" "phplistmine" {
  most_recent = true

  filter {
    name   = "name"
    values = ["phplist2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["625097054767"] # Canonical
}
