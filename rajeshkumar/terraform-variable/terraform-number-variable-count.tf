variable "numofusers" {
  type = number
  description = "This is for demo of number variable"
  default = 3
}

resource "aws_iam_user" "example" {
  count = "${var.numofusers}"
  name  = "rajesh.${count.index}"
}
