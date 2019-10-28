# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-south-1"
  access_key = ""
  secret_key = ""
}

# Configure the GitHub Provider
provider "github" {
}
