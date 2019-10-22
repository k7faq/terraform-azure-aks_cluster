# kubernetes service and cluster 

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  dns_prefix          = "${var.dns_prefix}"
  kubernetes_version  = "${lookup(var.aks_config, "kubernetes_version")}"

  # # kubernetes node detailes
  # linux_profile {
  #   admin_username = "ubuntu"

  #   ssh_key {
  #     key_data = "${var.tls_private_key}"
  #   }
  # }

  agent_pool_profile {
    name            = "${lookup(var.aks_config, "node_pool")}"
    count           = "${lookup(var.aks_config, "number_of_agents")}"
    vm_size         = "${lookup(var.aks_config, "vm_size")}"
    os_type         = "${lookup(var.aks_config, "os_type")}"
    os_disk_size_gb = "${lookup(var.aks_config, "os_disk_size_gb")}"
    max_pods        = "${lookup(var.aks_config, "max_pods")}"
    # min_count           = "3"
    # max_count           = "10"
    # enable_auto_scaling = "true"
    type           = "${lookup(var.aks_config, "type")}"
    vnet_subnet_id = "${var.vnet_subnet_id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  # kubernetes network plugin used 
  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    #pod_cidr = "172.16.0.0/16"
    # service_cidr       = "172.16.128.0/24"
    # load_balancer_sku  = "standard"
    # dns_service_ip     = "172.16.128.138"
    # docker_bridge_cidr = "172.17.0.1/16"
  }

  # # kubernetes agent to monitor the agent    
  # addon_profile {
  #   oms_agent {
  #     enabled                    = true
  #     log_analytics_workspace_id = "${var.log_analytics_workspace_id}"
  #   }
  # }

  tags = "${var.tags}"
}
