![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Manual🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)


---

```bash
gcloud iam service-accounts create service-account-tf \
    --display-name="Service Account" \
    --description="Service account for Terraform"
gcloud projects add-iam-policy-binding integrationproject2-deployment \
    --member=serviceAccount:service-account-tf@integrationproject2-deployment.iam.gserviceaccount.com \
    --role=roles/owner
gcloud iam service-accounts keys create credentials.json \
    --iam-account=service-account-tf@integrationproject2-deployment.iam.gserviceaccount.com
```

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
terraform destroy # Destroy the Terraform-managed infrastructure
```