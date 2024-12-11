![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Manual🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [📡Setup infrastructure](#📡setup-infrastructure)
    1. [📦Environment](#📦environment)
    2. [🔨Terraform](#🔨terraform)
    3. [🌌Kubernetes Cluster](#🌌kubernetes-cluster)

---

## 📡Setup infrastructure

### 📦Environment

- Clone the repository.
```bash
cd /home/$USER
git clone https://github.com/EliasDeHondt/IntegrationProject2-Deployment.git
cd IntegrationProject2-Deployment
```

- Authenticate with Google Cloud.
```bash
gcloud init
# The first question, select one to use your primary settings.
# The second question, select your account connected to a billing account. Example: (xxx.xxx@student.kdg.be)
# The third question, select the project you want to use. Example: (integrationproject2)
# The fourth question you can simply ignore and press Ctrl+C (It's also possible that you will not have this question)
```

- Enable the necessary APIs.
```bash
sudo chmod +x Scripts/enable-google-apis.sh
Scripts/enable-google-apis.sh
```

### 🔨Terraform

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

- Install Terraform and initialize Terraform.
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install terraform -y

terraform init
```

- You can now `validate` the configuration. Then `plan` the configuration and then `apply` it.
```bash
terraform validate # Validate the configuration
terraform plan # Create an execution plan
terraform apply # Apply the changes
```

> **Note:** At times, Terraform may not fully recognize that various APIs in a configuration are enabled, and it may proceed without allowing sufficient time for an API to be completely activated before accessing Google Cloud resources. If the initial attempt fails, a simple retry often resolves the issue.

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

### 🌌Kubernetes Cluster

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

- Fill in your image paths, copy these from your GitLab Container Registry
```bash
export FRONTEND_IMAGE="registry.gitlab.com/..." # Change this to your frontend image path
export BACKEND_IMAGE="registry.gitlab.com/..." # Change this to your backend image path
export AI_IMAGE="registry.gitlab.com/..." # Change this to your ai image path
```

- Change the default image path to your path so all images can be pulled correctly
```bash
sed -i "s/registry.gitlab.com/$FRONTEND_IMAGE/g" pod1.yaml
sed -i "s/registry.gitlab.com/$BACKEND_IMAGE/g" pod3.yaml
sed -i "s/registry.gitlab.com/$AI_IMAGE/g" pod4.yaml
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

- Create Kubernetes Secret to use the Cloud SQL Auth Proxy.
```bash
kubectl create secret generic sql-auth-proxy --from-file=service_account.json=../Terraform/credentials.json
```

- Apply the different services.
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f . # Apply all the Kubernetes files in the current directory
```

- If you need the **ELK Stack** you can apply the following commands.
```bash
helm install filebeat https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/filebeat-7.15.0.tgz
helm install logstash https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/logstash-7.15.0.tgz
helm install elasticsearch https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/elasticsearch-7.15.0.tgz
helm install kibana https://raw.githubusercontent.com/EliasDeHondt/elk-filebeat/refs/heads/main/package/kibana-7.15.0.tgz
```

> **Note:** The ELK Stack is located in a different [repository](https://github.com/EliasDeHondt/elk-filebeat) give it a ⭐ if you like it!