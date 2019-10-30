variable "reponame" {
  type = string
  description = "This is for demo of string variable"
  default = "day3-allianz"
}

variable "count1" {
  type = number
  description = "This is for demo of number variable"
  default = 2
}

variable "validate" {
  type = bool
  description = "This is for demo of bool variable"
  default = true
}

resource "github_repository" "web" {
  name        = "${var.reponame}"
  description = "My awesome codebase"
  private = false
}
