# Deploy Mage to GCP

## GCP Permissions

Before proceeding, make sure service account has following roles assigned and all the below APIs are enabled.

### List of roles
1. Artifact Registry Reader
1. Artifact Registry Writer
1. BigQuery Admin
1. Cloud Filestore Editor
1. Cloud Run Admin
1. Cloud Run Developer
1. Cloud Run Service Agent
1. Cloud SQL Admin
1. Compute Admin
1. Quota Administrator
1. Serverless VPC Access Admin
1. Service Account Token Creator
1. Service Usage Admin
1. Storage Admin

### List of APIs

1. Cloud Run Admin API
1. Compute Engine API
1. Cloud Resource Manager API
1. Cloud SQL Admin API
1. BigQuery API
1. Serverless VPC Access API
1. Cloud Filestore API
1. Service Usage API
1. Kubernetes Engine API
1. Dataform API
1. Cloud Dataplex API
1. Analytics Hub API
1. Artifact Registry API
1. Backup for GKE API
1. BigQuery Connection API
1. BigQuery Data Policy API
1. BigQuery Migration API
1. BigQuery Reservation API
1. BigQuery Storage API
1. Cloud Autoscaling API
1. Cloud Deployment Manager V2 API
1. Cloud DNS API
1. Cloud Logging API
1. Cloud Monitoring API
1. Cloud OS Login API
1. Cloud Pub/Sub API
1. Cloud Storage
1. Container File System API
1. Container Registry API
1. Google Cloud Storage JSON API
1. IAM Service Account Credentials API
1. Identity and Access Management (IAM) API
1. Network Connectivity API
1. Secret Manager API

## Authentication:
  Run following command with your key file
  ```sh
  export GOOGLE_APPLICATION_CREDENTIALS='<Path to GCP service-account key.json>
  ```

  After Creating all the infrastructure via terraform, go to https://console.cloud.google.com/run and whitelist your ip to access mage run