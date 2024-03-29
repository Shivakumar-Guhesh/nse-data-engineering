variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "nse-deploy-mage"
}

variable "credentials" {
  description = "My Credentials"
  default     = "../../keys/nse-data-engineering-1b661da6efa6.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}

variable "container_cpu" {
  description = "Container cpu"
  default     = "2000m"
}

variable "container_memory" {
  description = "Container memory"
  default     = "2G"
}

variable "project_id" {
  type        = string
  description = "The name of the project"
  default     = "nse-data-engineering"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "asia-south1"
}

variable "zone" {
  type        = string
  description = "The default compute zone"
  default     = "asia-south1-a"
}


variable "repository" {
  type        = string
  description = "The name of the Artifact Registry repository to be created"
  default     = "nse-data-engineering-mage"
}

variable "database_user" {
  type        = string
  description = "The username of the Postgres database."
  default     = "mageuser"
}

variable "database_password" {
  type        = string
  description = "The password of the Postgres database."
  sensitive   = true
}

variable "docker_image" {
  type        = string
  description = "The docker image to deploy to Cloud Run."
  default     = "mageai/mageai:latest"
}

variable "docker_image_args" {
  type        = string
  description = "Arguments to the entrypoint.The docker image's CMD is used if this is not provided."
  default     = "USER_CODE_PATH=/home/src/nse-data-engineering"
}

variable "docker_image_command" {
  type        = string
  description = "Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided."
  default     = "mage start ./mage_files/"
}

variable "domain" {
  description = "Domain name to run the load balancer on. Used if `ssl` is `true`."
  type        = string
  default     = ""
}

variable "ssl" {
  description = "Run load balancer on HTTPS and provision managed certificate with provided `domain`."
  type        = bool
  default     = false
}
