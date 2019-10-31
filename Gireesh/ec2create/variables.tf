variable "account_name" {
  type        = "string"
  description = "Aws account name"
  default     = "gsbtrng"
}



variable "common_tags" {
  type        = "map"
  description = "A tagging scheme"
  default    ={
    Environment= "Production"
  } 
}


variable "ami" {
  type    = "string"
  default = "ami-0b69ea66ff7391e80"
}

