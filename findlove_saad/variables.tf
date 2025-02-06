variable "environment" {
  description = "Ambiente criado"
  default     = "prod"
}

variable "instance_type" {
  description = "Tipo de instancia na criada"
  default     = "t2.micro"
}

variable "ami" {
  description = "ami na AWS"
  default     = "ami-04b4f1a9cf54c11d0"
}
