![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Manual🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🌍Install Terraform](#🌍install-terraform)
3. [☁️Install GCloud CLI](#☁️install-gcloud-cli)
4. [📦Environment](#📦environment)
5. [📡Setup infrastructure](#📡setup-infrastructure)
    1. [🔨Terraform](#🔨terraform)
    2. [🌌Kubernetes Cluster](#🌌kubernetes-cluster)
6. [💣Tear down infrastructure](#💣tear-down-infrastructure)

---

## 🌍Install Terraform

- Install the necessary packages.
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

- Add the HashiCorp repository.
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

- Update the package list and install Terraform.
```bash
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install terraform -y
```

- Verify the installation.
```bash
terraform init
```

## ☁️Install GCloud CLI

- Update and upgrade system.
```bash
sudo apt-get update -y && sudo apt-get upgrade -y
```

- Install tools
```bash
sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo -y
```

- Download google cloud CLI
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```

- Add the gcloud CLI distribution URI as a package source
```bash
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
```

- Update and install the gcloud CLI
```bash
sudo apt-get update && sudo apt-get install google-cloud-cli
```

- Test
```bash
gcloud version
```

## 📦Environment

- Authenticate with Google Cloud.
```bash
gcloud init
# The first question, select one to use your primary settings.
# The second question, select your account connected to a billing account. Example: (xxx.xxx@student.kdg.be)
# The third question, select the project you want to use. Example: (integrationproject2)
# The fourth question you can simply ignore and press Ctrl+C (It's also possible that you will not have this question)
```

- Clone the repository.
```bash
git clone https://github.com/EliasDeHondt/IntegrationProject2-Deployment.git /home/$USER/IntegrationProject2-Deployment
cd /home/$USER/IntegrationProject2-Deployment
```

## 📡Setup infrastructure

### 🔨Terraform

- Enable the necessary APIs.
```bash
sudo chmod +x Scripts/enable-google-apis.sh && Scripts/enable-google-apis.sh
```

- Navigate to the Terraform directory.
```bash
cd Terraform
```

- Create a new service account and download the credentials file.
```bash
export PROJECT_ID="integrationproject2" # Change this to your project ID

gcloud iam service-accounts create service-account-tf \
    --display-name="Service Account" \
    --description="Service account for Terraform"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:service-account-tf@$PROJECT_ID.iam.gserviceaccount.com \
    --role=roles/owner

gcloud iam service-accounts keys create credentials.json \
    --iam-account=service-account-tf@$PROJECT_ID.iam.gserviceaccount.com
```

- Apply the Terraform configuration to create the Kubernetes cluster and the necessary resources.
```bash
terraform apply
```

### 🌌Kubernetes Cluster

- Get the credentials for the Kubernetes cluster.
```bash
gcloud container clusters get-credentials cluster-1 --region=us-central1-c
```

- Test the connection to the internet. **(Optional)**
```bash
kubectl run test-pod --image=busybox --restart=Never -- sh -c "wget -qO- https://eliasdh.com"
kubectl logs test-pod
kubectl delete pod test-pod
```

- Change the deafult project id to the project id you previously typed in.
```bash
cd ../Kubernetes
sed -i "s/projectId/$PROJECT_ID/g" pod2.yaml pod3.yaml
```

- If you have followed the [Deployment-Agreement](/Documentation/Deployment-Agreement.md) to the letter, you can skip this section. However, since that's likely not the case, this part will guide you on where to update the `podX.yaml` files to configure the environment variables (env) specific to your application.
    - [POD1 Frontend](/Kubernetes/pod1.yaml): Update on line 29.
    - [POD2 Keycloak](/Kubernetes/pod2.yaml): Update on line 28.
    - [POD3 Backend](/Kubernetes/pod3.yaml): Update on line 29.
    - [POD4 Python](/Kubernetes/pod3.yaml): Update on line 28.

- If you're using a service account key, you can add the key to the `sql-auth-proxy` secret. This is necessary to connect to the Cloud SQL database.
```bash
kubectl create secret generic sql-auth-proxy --from-file=service_account.json=../Terraform/credentials.json
```

- Fill in your image paths, copy these from your GitLab Container Registry.
```bash
export FRONTEND_IMAGE="registry.gitlab.com/..." # Change this to your frontend image path
export BACKEND_IMAGE="registry.gitlab.com/..." # Change this to your backend image path
export AI_IMAGE="registry.gitlab.com/..." # Change this to your ai image path
```

- Change the default image path to your path so all images can be pulled correctly.
```bash
sed -i "s|registry.gitlab.com|$FRONTEND_IMAGE|g" pod1.yaml
sed -i "s|registry.gitlab.com|$BACKEND_IMAGE|g" pod3.yaml
sed -i "s|registry.gitlab.com|$AI_IMAGE|g" pod4.yaml
```

- Get your GitLab `read_registry` personal access token.
    - Go to [GitLab](https://gitlab.com/-/user_settings/personal_access_tokens?name=Read+Registry+token&scopes=read_registry).
    - Change the expiration date to `2025-01-26`.
    - Create personal access token.
    - Save and copy the token (this personal access token will only be shown once).

> **Note:** This should only be done once per user, if the expiration date is set correctly.

- Create Kubernetes Secret to pull GitLab registry images (change everything between <> !).
```bash
kubectl create secret docker-registry gitlab-registry \
    --docker-server=registry.gitlab.com \
    --docker-username=<your-gitlab-username> \
    --docker-password=<your-personal-access-token> \
    --docker-email=<your-kdg-email>
```

- If you want to use the **Ingress** service, you can apply the following commands.
```bash
# Install cert-manager and ingress-nginx
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

# If you want to use multiple A records in your DNS
kubectl apply -f ingress-multi-domain.yaml

# If you want to use a single A record in your DNS
export TEAMID="team0" # Change this to your team ID
sed -i "s|teamx|$TEAMID|g" ingress-single-fqdn.yaml
kubectl apply -f ingress-single-fqdn.yaml
```

- Apply the different services.
```bash
kubectl apply -f credentials.yaml
kubectl apply -f pod1.yaml
kubectl apply -f pod2.yaml
kubectl apply -f pod3.yaml
kubectl apply -f pod4.yaml
kubectl apply -f pod5.yaml
```

- If you need the **ELK Stack** you can apply the following commands.
```bash
helm install filebeat https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/filebeat-7.15.0.tgz
helm install logstash https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/logstash-7.15.0.tgz
helm install elasticsearch https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/elasticsearch-7.15.0.tgz
helm install kibana https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/kibana-7.15.0.tgz
```

> **Note:** The ELK Stack is located in a different [repository](https://github.com/EliasDeHondt/elk-filebeat) give it a ⭐ if you like it!

## 💣Tear down infrastructure

> **Note:** If you wanna start over, you can simply delete the entire project. Otherwise below you can find some useful deletion commands.

- The following command deletes all files from Terraform that were created when applying the configuration.
```bash
rm -rf terraform.tfstate .terraform.lock.hcl .terraform.tfstate.backup .terraform/
```

- Remove the credentials file.
```bash
rm -rf credentials.json
```

- Destroy the entire terraform configuration.
```bash
terraform destroy
```

- Remove the service account.
```bash
gcloud iam service-accounts delete service-account-tf@$PROJECT_ID.iam.gserviceaccount.com
```

- Delete the Kubernetes cluster.
```bash
gcloud container clusters delete cluster-1 --region=us-central1-c
```

- Remove the Kubernetes `podX.yaml` files.
```bash
kubectl delete -f .
```