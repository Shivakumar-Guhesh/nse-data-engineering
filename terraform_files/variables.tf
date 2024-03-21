variable "credentials" {
  description = "My Credentials"
  default     = "../keys/nse-data-engineering-1b661da6efa6.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  #Update the below to your  gcp project
  default = "nse-data-engineering"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "asia-south1-a"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default = "ASIA-SOUTH1"
}

variable "gcp_bigquery_dataset" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default = "nse_data_all_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  default = "nse_data_gcs_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
