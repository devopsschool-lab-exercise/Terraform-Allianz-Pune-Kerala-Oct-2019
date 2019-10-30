variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["rajesh", "kumar", "xyz"]
}
# Alternate of for each using count 
resource "github_repository" "repox" {
  count = "${var.names}"
  name  = "rajesh.${count.index}"
  description = "My awesome codebase"
  private = false
}

# using for-each
output "upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}
