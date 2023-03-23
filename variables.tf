variable "region" {
  description = "La región de AWS en la que se creará la infraestructura."
  type        = string
  default     = "us-east-1"
}

variable "accountName" {
  description = "El nombre de la cuenta de AWS que se creará."
  type        = string
}

variable "SSOEmail" {
  description = "La dirección de correo electrónico de la persona responsable de la cuenta de AWS."
  type        = string
}

variable "SSOUserFirstName" {
  description = "El primer nombre del usuario de IAM que se creará."
  type        = string
}

variable "SSOUserLastName" {
  description = "El apellido del usuario de IAM que se creará."
  type        = string
}

variable "managedOrganizationalUnit" {
  description = "La unidad organizativa en la que se creará la cuenta de AWS."
  type        = string
}
