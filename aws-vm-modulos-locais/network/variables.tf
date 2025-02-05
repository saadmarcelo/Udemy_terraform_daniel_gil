variable "cidr_vpc" {
  description = "Cidr para a VPC criada na AWS"
  type        = string
}
variable "cidr_subnet" {
  description = "Cidr para a subnet criada na AWS"
  type        = string
}
variable "environment" {
  description = "Environment em que foram craido os recursos na AWS"
  type        = string
}
