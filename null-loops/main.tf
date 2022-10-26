/* Alta3 Research - rzfeeser@alta3.com
   Working with "for_each" within a null_resource */

/* Terraform block */
terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/* a list of local variables */
locals {
  avengers = {
               "Iron Man"= {
                "power"= "money"
                "enemy"= "Iron Monger"}
               "Black Panther"= {
                "power"= "vibranium suit"
                "enemy"= "War Monger"}
               "She-Hulk"= {
                "power"= "super strength"
                "enemy"= "Abomination"}
             }
}





resource "null_resource" "avengers" {
  for_each = tomap(local.avengers)
  triggers = {
    name = each.key
    power = each.value.power
    enemy = each.value.enemy
  }
}

/* We want these outputs */
output "avengers" {
  value = null_resource.avengers
}

