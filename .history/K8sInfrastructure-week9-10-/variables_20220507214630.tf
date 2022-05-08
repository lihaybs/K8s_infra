
variable "RG" {
  type        = string
  default     = "RG"
  description = "Reasource group name"
}

variable "Vnet_address_space_prefixes" {
  type    = list(any)
  default = ["10.30.0.0/16"]

}
variable "private_address_space" {
  type    = list(any)
  default = ["10.30.2.0/24"]

}

variable "public_address_space" {
  type    = list(any)
  default = ["10.30.1.0/24"]

}
variable "private_subnet_name" {
  type    = string
  default = "Data_Tier"
}
variable "public_subnet_name" {
  type    = string
  default = "Web_Tier"
}

variable "tags" {
  type    = string
  default = "enviroment"
}
variable "VnetName" {
  type        = string
  default     = "Vnet"
  description = "virtual network name"

}

variable "location" {
  type        = string
  description = "Azure location of terraform server environment"
  default     = "East US"

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
variable "linux_vm_Name" {
  type        = string
  default     = "Agent"
  description = "virtual machine name"

}
variable "linux_vm_nic_Name" {
  type        = string
  default     = "linux_vm_nic"
  description = "Agent Controller nic name"
}

variable "linux_vm_Ip_name" {
  type        = string
  default     = "linux_vm_Ip"
  description = "Agent Controller Ip name"
}

variable "storage_account_Name" {
  type    = string
  default = "odedstorage1"
}

variable "node_count" {
  default = 3
}

variable "cluster_name" {
  type    = string
  default = "k8s-weight-tracker"
}

variable "kubernetes_version" {
  type    = string
  default = "1.23.5"
}

variable "acr_name" {
  type    = string
  default = "acrforapp"
}


variable "okta_secret" {
  type    = string
  default = ""
}
variable "appId" {
  type    = string
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  type    = string
  description = "Azure Kubernetes Service Cluster password"
}

variable "okta_client_id" {
  type    = string
  default = ""
}

variable "okta_org_url" {
  type    = string
  default = ""
}

variable "okta_key" {
  default = ""
}

variable "pg_user" {
  type    = string
  default = "postgres"
}

variable "pg_pass" {
  type    = string
  default = ""
}