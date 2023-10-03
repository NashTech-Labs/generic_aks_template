
# Create an AKS cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix
  kubernetes_version = var.aks_version


  identity {
    type = var.identity_type
  }

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.default_node_vm_size
    vnet_subnet_id      = var.subnet_1_id
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.min_node_count
    max_count           = var.max_node_count
    type                = var.default_node_pool_type

  }

  network_profile {
    network_plugin = var.network_plugin
    dns_service_ip = var.dns_service_ip
    service_cidr   = var.service_cidr
    pod_cidr       = var.pod_cidr
  }
  private_cluster_enabled = var.private_cluster_enabled
  # lifecycle {
  #   ignore_changes = [ default_node_pool ]
  # }

}
resource "local_sensitive_file" "kubeconfig" {
  depends_on = [ azurerm_kubernetes_cluster.aks_cluster ]
  content = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  filename = "./kubeconfig"
}
# resource "null_resource" "get_kubeconfig" {  
#   depends_on = [azurerm_kubernetes_cluster.aks_cluster]
#    triggers = {    
#      always_run = "${timestamp()}"  
#       }  
#  provisioner "local-exec" { 
#       command = "az aks get-credentials --resource-group ${var.rg_name} --name ${var.aks_name} --overwrite-existing --file ./.newkubeconfig.yaml"  
#        }
#         }
