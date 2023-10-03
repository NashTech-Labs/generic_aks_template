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

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for the virtual machine."
}
variable "pass" {
  type        = string
  default     = "Admin_12345"
  description = "The password for the virtual machine admin user."
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
variable "vnet_subnet_id_2" {
  type = string
}

variable "network_nic_name" {
  type        = string
  default     = "myNic"
  description = "The name of the network interface."
}

variable "network_ip_config" {
  type        = string
  default     = "my_nic_config"
  description = "The name of the IP configuration for the network interface."
}

variable "private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "The allocation method for the private IP address."
}

variable "public_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "The allocation method for the public IP address."
}

variable "public_ip_name" {
  type        = string
  default     = "my_public_ip"
  description = "The name of the public IP."
}

variable "network_security_group_name" {
  type        = string
  default     = "myNsg"
  description = "The name of the network security group."
}

variable "security_rule_name" {
  type        = string
  default     = "SSH"
  description = "The name of the security rule."
}

variable "security_rule_priority" {
  type        = number
  default     = 1001
  description = "The priority of the security rule."
}

variable "security_rule_direction" {
  type        = string
  default     = "Inbound"
  description = "The direction of the security rule (Inbound/Outbound)."
}

variable "security_rule_access" {
  type        = string
  default     = "Allow"
  description = "The access level of the security rule (Allow/Deny)."
}

variable "security_rule_protocol" {
  type        = string
  default     = "Tcp"
  description = "The protocol for the security rule."
}

variable "security_rule_source_port_range" {
  type        = string
  default     = "*"
  description = "The source port range for the security rule."
}

variable "security_rule_destination_port_range" {
  type        = string
  default     = "22"
  description = "The destination port range for the security rule."
}

variable "security_rule_source_address_prefix" {
  type        = string
  default     = "*"
  description = "The source address prefix for the security rule."
}

variable "security_rule_destination_address_prefix" {
  type        = string
  default     = "*"
  description = "The destination address prefix for the security rule."
}

variable "vm_name" {
  type        = string
  default     = "myVM1"
  description = "The name of the virtual machine."
}

variable "os_disk_name" {
  type        = string
  default     = "myOsDisk"
  description = "The name of the OS disk."
}

variable "os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The caching option for the OS disk."
}

variable "os_disk_storage_account_type" {
  type        = string
  default     = "Premium_LRS"
  description = "The storage account type for the OS disk."
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "The size of the virtual machine."
}

variable "source_image_publisher" {
  type        = string
  default     = "Canonical"
  description = "The publisher of the source image."
}

variable "source_image_offer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "The offer of the source image."
}

variable "source_image_sku" {
  type        = string
  default     = "22_04-lts-gen2"
  description = "The SKU of the source image."
}

variable "source_image_version" {
  type        = string
  default     = "latest"
  description = "The version of the source image."
}

variable "computer_name" {
  type        = string
  default     = "myVm"
  description = "Name of the computer for the VM."
}
variable "disable_password_authentication" {
  type        = bool
  default     = false
  description = "Set this to true if you want to disable password authentication."
}
variable "private_cluster_enabled" {
  type        = bool
  default     = true
  description = "Whether the AKS cluster is private."
}