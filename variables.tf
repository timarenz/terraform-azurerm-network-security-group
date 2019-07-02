variable "environment_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 48
}

variable "owner_name" {
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = "West Europe"
}

variable "resource_group_name" {
  type = string
}

variable "rules" {
  type = list
  default = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "ssh"
    priority                                   = 100
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
}

