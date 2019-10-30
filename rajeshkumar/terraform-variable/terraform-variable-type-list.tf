variable "users" {
    type    = "list"
    default = ["devopsschool11", "devopsschool2", "devopsschool3"]
    description = "This is for demo of list variable"
}

variable "gitrepos" {
    type    = "list"
    default = ["devopsschool11", "devopsschool2", "devopsschool3"]
    description = "This is for demo of list variable"
}

resource "aws_iam_user" "iamuser" {
  name = "${var.users[0]}"
}

resource "github_repository" "repo1" {
  name = "${var.gitrepos[0]}"
  description = "My awesome codebase"
  private = false
}

resource "github_repository" "repo2" {
  name = "${var.gitrepos[1]}"
  description = "My awesome codebase"
  private = false
}

resource "github_repository" "repo3" {
  name = "${var.gitrepos[2]}"
  description = "My awesome codebase"
  private = false
}
