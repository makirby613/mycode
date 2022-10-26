terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "null" {
  # Configuration options
}

locals {
	rgs = {
          "alpha" = { "region" ="eastus"
                      "vnet" ="omega" }
          "bravo" = { "region" ="southindia"
                      "vnet" ="psi" }
          "charlie" = {"region" = "westus2"
                       "vnet" ="chi" }
                }
}

resource "null_resource" "dummy_rgs" {
	for_each = tomap(local.rgs)
	triggers = {
		name= each.key
		region= each.value.region
}
}

resource "null_resource" "dummy_vnets" {
	for_each = tomap(local.rgs)
	triggers = {
		name= each.value.vnet
		region= each.value.region
}
}
