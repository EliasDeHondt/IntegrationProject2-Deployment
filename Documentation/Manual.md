![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Manual🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)


---

```bash
<<<<<<< HEAD
gcloud iam service-accounts create service-account-tf \
    --display-name="Service Account" \
    --description="Service account for Terraform"
gcloud projects add-iam-policy-binding integrationproject2-deployment \
    --member=serviceAccount:service-account-tf@integrationproject2-deployment.iam.gserviceaccount.com \
    --role=roles/owner
gcloud iam service-accounts keys create credentials.json \
    --iam-account=service-account-tf@integrationproject2-deployment.iam.gserviceaccount.com
```

=======
git clone https://github.com/EliasDeHondt/IntegrationProject2-Deployment.git
cd IntegrationProject2-Deployment/Terraform
```

- Create a new service account and download the credentials file
```bash
gcloud init

PROJECT_ID="integrationproject2-project3"

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
>>>>>>> 1d7d050e9cf16d57fd05717700967c39453b432e
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install terraform -y

terraform init
```

```bash
terraform validate # Validate the configuration
terraform plan # Create an execution plan
terraform apply # Apply the changes
<<<<<<< HEAD
terraform destroy # Destroy the Terraform-managed infrastructure
=======
terraform destroy # Destroy the resources
```

- Get the credentials for the Kubernetes cluster
```bash
gcloud container clusters get-credentials cluster-1 --region=us-central1-c
```

- Test the connection to the internet
```bash
kubectl run test-pod --image=busybox --restart=Never -- sh -c "wget -qO- https://eliasdh.com"
kubectl logs test-pod
kubectl delete pod test-pod
```

```bash
cd ../Kubernetes
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.11.0/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f . # Apply all the Kubernetes files in the current directory
>>>>>>> 1d7d050e9cf16d57fd05717700967c39453b432e
```