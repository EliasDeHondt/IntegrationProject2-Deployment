![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Deployment Agreement🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Images](#images)



---

## 🖖Images
- Kubernetes Cluster:
    - Pod 1:
        - React Frontend: (Images 1)
            - Name: `react-frontend`
            - Port: `3000`
    - Pod 2:
        - Keycloak IAM:
            - Name: `keycloak-iam`
            - Port: `8080`
        - Cloud SQL Proxy Sidecar:
            - Name: `cloud-sql-proxy`
            - Port: `3306`
    - Pod 3:
        - Spring Backend (Images 2):
            - Name: `spring-backend`
            - Port: `8081`
        - Cloud SQL Proxy Sidecar:
            - Name: `cloud-sql-proxy`
            - Port: `3306`
    - Pod 4:
        - Python AI (Images 3):
            - Name: `python-ai`
            - Port: `5000`
    - Pod 5:
        - ELK stack:
            - Name: `elk-stack`
            - Port: `5601`

- Database PostgreSQL
    - Name: `database-postgresql`
    - Port: `5432`