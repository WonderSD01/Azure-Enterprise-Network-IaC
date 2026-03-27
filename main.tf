terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.58.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "southeastasia"
  managed_by = ""
  name       = "RG-Project-Network"
  tags       = {}
}
resource "azurerm_virtual_network" "res-1" {
  address_space                  = ["10.0.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "southeastasia"
  name                           = "vnet-hub"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  subnet = [{
    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/deedecb8-b154-4dce-89e1-cf8915b72785/resourceGroups/RG-Project-Network/providers/Microsoft.Network/virtualNetworks/vnet-hub/subnets/default"
    name                                          = "default"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.0.1.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/deedecb8-b154-4dce-89e1-cf8915b72785/resourceGroups/RG-Project-Network/providers/Microsoft.Network/virtualNetworks/vnet-hub/subnets/snet-shared"
    name                                          = "snet-shared"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-2" {
  address_prefixes                              = ["10.0.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "vnet-hub"
  depends_on = [
    azurerm_virtual_network.res-1,
  ]
}
resource "azurerm_subnet" "res-3" {
  address_prefixes                              = ["10.0.1.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "snet-shared"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "vnet-hub"
  depends_on = [
    azurerm_virtual_network.res-1,
  ]
}
resource "azurerm_virtual_network_peering" "res-4" {
  allow_forwarded_traffic                = false
  allow_gateway_transit                  = false
  allow_virtual_network_access           = true
  local_subnet_names                     = []
  name                                   = "spoke-to-hub"
  only_ipv6_peering_enabled              = false
  peer_complete_virtual_networks_enabled = true
  remote_subnet_names                    = []
  remote_virtual_network_id              = azurerm_virtual_network.res-5.id
  resource_group_name                    = azurerm_resource_group.res-0.name
  use_remote_gateways                    = false
  virtual_network_name                   = "vnet-hub"
  depends_on = [
    azurerm_virtual_network.res-1,
  ]
}
resource "azurerm_virtual_network" "res-5" {
  address_space                  = ["10.1.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "southeastasia"
  name                           = "vnet-spoke-app"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  subnet = [{
    address_prefixes                              = ["10.1.0.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/deedecb8-b154-4dce-89e1-cf8915b72785/resourceGroups/RG-Project-Network/providers/Microsoft.Network/virtualNetworks/vnet-spoke-app/subnets/default"
    name                                          = "default"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
    }, {
    address_prefixes                              = ["10.1.1.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/deedecb8-b154-4dce-89e1-cf8915b72785/resourceGroups/RG-Project-Network/providers/Microsoft.Network/virtualNetworks/vnet-spoke-app/subnets/snet-workload"
    name                                          = "snet-workload"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-6" {
  address_prefixes                              = ["10.1.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "vnet-spoke-app"
  depends_on = [
    azurerm_virtual_network.res-5,
  ]
}
resource "azurerm_subnet" "res-7" {
  address_prefixes                              = ["10.1.1.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "snet-workload"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "vnet-spoke-app"
  depends_on = [
    azurerm_virtual_network.res-5,
  ]
}
resource "azurerm_virtual_network_peering" "res-8" {
  allow_forwarded_traffic                = false
  allow_gateway_transit                  = false
  allow_virtual_network_access           = true
  local_subnet_names                     = []
  name                                   = "spoke-to-hub"
  only_ipv6_peering_enabled              = false
  peer_complete_virtual_networks_enabled = true
  remote_subnet_names                    = []
  remote_virtual_network_id              = azurerm_virtual_network.res-1.id
  resource_group_name                    = azurerm_resource_group.res-0.name
  use_remote_gateways                    = false
  virtual_network_name                   = "vnet-spoke-app"
  depends_on = [
    azurerm_virtual_network.res-5,
  ]
}
