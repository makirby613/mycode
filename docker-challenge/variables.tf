 variable "image_name" {
     description = "Name of the image"
     type        = string
     default     = "registry.gitlab.com/alta3research/simpleflaskservice:1.0"
}

variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "AltaResearchWebService"
}

 variable "internal_port" {
     description = "internal port number"
     type        = number
     default     = 9876
}

 variable "external_port" {
     description = "external port number"
     type        = number
     default     = 5432
}
