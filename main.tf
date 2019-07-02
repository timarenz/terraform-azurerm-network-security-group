locals {
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.environment_name}-${var.nsg_name}-nsg"
  location            = var.region
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.rules
    iterator = r
    content {
      access                                     = r.value.access
      description                                = r.value.description
      destination_address_prefix                 = r.value.destination_address_prefix
      destination_address_prefixes               = r.value.destination_address_prefixes
      destination_application_security_group_ids = r.value.destination_application_security_group_ids
      destination_port_range                     = r.value.destination_port_range
      destination_port_ranges                    = r.value.destination_port_ranges
      direction                                  = r.value.direction
      name                                       = r.value.name
      priority                                   = r.value.priority
      protocol                                   = r.value.protocol
      source_address_prefix                      = r.value.source_address_prefix
      source_address_prefixes                    = r.value.source_address_prefixes
      source_application_security_group_ids      = r.value.source_application_security_group_ids
      source_port_range                          = r.value.source_port_range
      source_port_ranges                         = r.value.source_port_ranges
    }
  }

  tags = local.common_tags
}
