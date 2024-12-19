![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Notes🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [0️⃣5️⃣Team](#0️⃣5️⃣team)
   1. [⬆️Up](#⬆️up)
   2. [⬇️Down](#⬇️down)
3. [0️⃣6️⃣Team](#0️⃣6️⃣team)
    1. [⬆️Up](#⬆️up-1)
    2. [⬇️Down](#⬇️down-1)
4. [0️⃣9️⃣Team](#0️⃣9️⃣team)
    1. [⬆️Up](#⬆️up-2)
    2. [⬇️Down](#⬇️down-2)
5. [2️⃣0️⃣Team](#2️⃣0️⃣team)
    1. [⬆️Up](#⬆️up-3)
    2. [⬇️Down](#⬇️down-3)

---

## 0️⃣5️⃣Team

### ⬆️Up

- Kubernetes:
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team5/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team5/compose.yaml | sudo docker compose -f - up -d
```

### ⬇️Down

- Kubernetes:
```bash
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team5/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team5/compose.yaml | sudo docker compose -f - down
sudo docker volume rm team5_compose_db_data
```

## 0️⃣6️⃣Team

- Kubernetes:
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team6/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team6/compose.yaml | sudo docker compose -f - up -d
```

### ⬇️Down

- Kubernetes:
```bash
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team6/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team6/compose.yaml | sudo docker compose -f - down
sudo docker volume rm team6_compose_db_data
```

## 0️⃣9️⃣Team

- Kubernetes:
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team9/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team9/compose.yaml | sudo docker compose -f - up -d
```

### ⬇️Down

- Kubernetes:
```bash
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team9/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team9/compose.yaml | sudo docker compose -f - down
sudo docker volume rm team9_compose_db_data
```

## 2️⃣0️⃣Team

- Kubernetes:
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team20/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team20/compose.yaml | sudo docker compose -f - up -d
```

### ⬇️Down

- Kubernetes:
```bash
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/refs/heads/main/Team%20Specific%20Data/Team20/kubernetes.yaml
```

- Compose:
```bash
curl -s https://raw.githubusercontent.com/EliasDeHondt/IntegrationProject2-Deployment/main/Team%20Specific%20Data/Team20/compose.yaml | sudo docker compose -f - down
sudo docker volume rm team20_compose_db_data
```