variable "rg_location" {
  type        = string
  # default     = "east us"
  description = "The location/region for the Azure resource group."
}

variable "rg_name" {
  type        = string
  # default     = "my-aks-cluster"
  description = "The name for the Azure resource group."
}
