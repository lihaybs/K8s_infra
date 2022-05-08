

variable "Resouce_group_name" {
  type = string

  description = "Resouce_group_name name"

}

variable "subnet_id" {
  type        = string
  default     = "your subnet id"

}
variable "tags" {
  type    = string
  default = "enviroment"
}
variable "VnetName" {
    type        = string
  description = "virtual network name"
}
variable "linux_vm_Name" {
  type        = string
  description = "virtual machine name"

}
variable "linux_vm_nic_Name" {
    type        = string
  description = "Agent Controller nic name"
}

variable "linux_vm_Ip_name" {
    type        = string
  description = "Agent Controller Ip name"
}

variable "location" {
  type        = string
  description = "Azure location of terraform server environment"

}

variable "admin_user_name" {
  type        = string
  description = "user name for vm login"
  default     = "Input your user name"

}
variable "admin_password" {
  type        = string
  description = "password for vm login"
  default     = "Input your password here"

}
variable "okta_secret" {
    type        = string
     default = ""
}

variable "okta_client_id" {
    type        = string
  default = ""
}

variable "okta_org_url" {
    type        = string
  default = ""
}

variable "okta_key" {
    type        = string
  default = ""
}

variable "pg_user" {
    type        = string
  default = "postgres"
}

variable "pg_pass" {
    type        = string
  default = "pass"
}




