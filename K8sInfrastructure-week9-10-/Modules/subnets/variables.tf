

variable "private_address_space" {
  type    = list(any)

}

variable "public_address_space" {
  type    = list(any)

}

variable "VnetName" {
  type = string
  description = "vnet name"

}
variable "Resouce_group_name" {
  type = string
  description = "Resouce_group_name name"

}
/* variable "private_subnet_name" {
  type    = string
} */
variable "public_subnet_name" {
  type    = string
}

variable "tags" {
  type        = string
  description = "tags"
  default     = "this is a tag"

}
