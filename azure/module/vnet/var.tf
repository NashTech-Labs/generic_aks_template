variable "rg_location" {
  type        = string
  default     = "east us"
  description = "The location/region for the Azure resource group."
}

variable "rg_name" {
  type        = string
  default     = "my-aks-cluster"
  description = "The name for the Azure resource group."
}

variable "vnet_1" {
  type        = string
  default     = "vnet01"
  description = "The name of the first virtual network."
}
variable "subnet_1" {
  type        = string
  default     = "subnet01"
  description = "The name of the first subnet."
}

variable "subnet_2" {
  type        = string
  default     = "subnet02"
  description = "The name of the second subnet."
}

variable "vnet_1_address_space" {
  type        = list(string)
  default     = ["172.1.0.0/16"]
  description = "The address space of the first virtual network."
}

variable "subnet_1_address_prefix" {
  type        = list(string)
  default     = ["172.1.0.0/17"]
  description = "The address prefix of the first subnet."
}


variable "subnet_2_address_prefix" {
  type        = list(string)
  default     = ["172.1.128.0/17"]
  description = "The address prefix of the second subnet."
}
variable "private_cluster_enabled" {
  type        = bool
  default     = true
  description = "Whether the AKS cluster is private."
}