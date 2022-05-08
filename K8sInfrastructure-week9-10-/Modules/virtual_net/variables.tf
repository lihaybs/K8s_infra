
variable "address_space" {
  type    = list(any)
  default = ["10.30.0.0/16"]
}
variable "VnetName" {
  type = string
  default = "Vnet"
  description = "vnet name"

}
variable "Resouce_group_name" {
  type = string
  description = "Resouce_group_name name"

}
variable "location" {
  type        = string
  description = "Azure location of terraform server environment"
  default     = "East US"

}
variable "tags" {
  type        = string
  description = "tags"
  default     = "this is a tag"

}