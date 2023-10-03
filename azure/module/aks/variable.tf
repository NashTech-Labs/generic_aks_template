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
variable "subnet_1_id" {
  type = string
}
variable "aks_name" {
  type        = string
  default     = "my-aks-cluster"
  description = "The name for the Azure Kubernetes Service (AKS) cluster."
}

variable "dns_prefix" {
  type        = string
  default     = "myakscluster"
  description = "The DNS prefix used for the AKS cluster's URL."
}
variable "aks_version" {
  type = string
  default = "1.26.6"
  description = "The version of Kubernetes"
}
variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "The type of identity assigned to resources like AKS."
}
variable "default_node_pool_name" {
  type        = string
  default     = "default"
  description = "The name of the default node pool in AKS."
}
variable "node_count" {
  type        = number
  default     = 1
  description = "The number of nodes in the AKS cluster's default node pool."
}

variable "default_node_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "The size of the virtual machines in the default node pool."
}

variable "enable_auto_scaling" {
  type        = bool
  default     = true
  description = "Enable auto-scaling for the default node pool in AKS."
}

variable "min_node_count" {
  type        = number
  default     = 1
  description = "The minimum number of nodes in the default node pool."
}

variable "max_node_count" {
  type        = number
  default     = 2
  description = "The maximum number of nodes in the default node pool."
}
variable "default_node_pool_type" {
  type        = string
  default     = "VirtualMachineScaleSets"
  description = "The type of the default node pool in AKS."
}
variable "network_plugin" {
  type        = string
  default     = "kubenet"
  description = "The network plugin used in AKS."
}
variable "dns_service_ip" {
  type        = string
  default     = "192.168.1.1"
  description = "The DNS service IP address in AKS."
}

variable "service_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "The service CIDR in AKS."
}

variable "pod_cidr" {
  type        = string
  default     = "172.16.0.0/22"
  description = "The pod CIDR in AKS."
}
variable "private_cluster_enabled" {
  type        = bool
  default     = true
  description = "Whether the AKS cluster is private."
}