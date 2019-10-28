# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-south-1"
  access_key = "AKIAJQYTBQHVCLMAZZKA"
  secret_key = "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"
}

# Configure the GitHub Provider
provider "github" {
}
