![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Manual🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [📡Setup infrastructure](#📡setup-infrastructure)


---


## 📡Setup infrastructure

### 🔨Terraform

- Clone the repository and navigate to the Terraform directory
```bash
git clone https://github.com/EliasDeHondt/IntegrationProject2-Deployment.git
cd IntegrationProject2-Deployment/Terraform
```

- Authenticate with Google Cloud
```bash
gcloud init
# The first question, select one to use your primary settings.
# The second question, select your account connected to a billing account. Example: (xxx.xxx@student.kdg.be)
# The third question, select the project you want to use. Example: (integrationproject2)
# The fourth question you can simply ignore and press Ctrl+C (It's also possible that you will not have this question)
```

- Create a new service account and download the credentials file
```bash
PROJECT_ID="integrationproject2-project" # Change this to your project ID

gcloud iam service-accounts create service-account-tf \
    --display-name="Service Account" \
    --description="Service account for Terraform"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:service-account-tf@$PROJECT_ID.iam.gserviceaccount.com \
    --role=roles/owner

gcloud iam service-accounts keys create credentials.json \
    --iam-account=service-account-tf@$PROJECT_ID.iam.gserviceaccount.com
```

- Install Terraform and initialize Terraform
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install terraform -y

terraform init
```

- You can now `validate` the configuration. Then `plan` the configuration and then `apply` it. (When you're finished, you can `destroy` it).
```bash
terraform validate # Validate the configuration
terraform plan # Create an execution plan
terraform apply # Apply the changes
terraform destroy # Destroy the resources
```

> **Note:** At times, Terraform may not fully recognize that various APIs in a configuration are enabled, and it may proceed without allowing sufficient time for an API to be completely activated before accessing Google Cloud resources. If the initial attempt fails, a simple retry often resolves the issue.

- Get the credentials for the Kubernetes cluster
```bash
gcloud container clusters get-credentials cluster-1 --region=us-central1-c
```

- Test the connection to the internet **(Optional)**
```bash
kubectl run test-pod --image=busybox --restart=Never -- sh -c "wget -qO- https://eliasdh.com"
kubectl logs test-pod
kubectl delete pod test-pod
```

### 🌌Kubernetes Cluster

- Apply the different services.
```bash
cd ../Kubernetes
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.11.0/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f . # Apply all the Kubernetes files in the current directory
```