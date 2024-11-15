![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Deployment Agreement🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Images](#images)
3. [Deadlines] (#Deadlines)
4. [Contactpersonen] (#Contactpersonen)
5. [Communicatie] (#Communicatie)



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

- Registry
    - `Gitlab Container Registry`

## Deadlines
- Sprint 1:
    - Dev -> DevOps:
        - Dummy images (19/11/2024)
        - Connectiviteit tussen containers Frontend, Backend, Database (22/11/2024)
    - DevOps -> Dev:
        - Deployment files, zowel lokaal als cloud (26/11/2024)
- Sprint 2: 
    - Dev -> DevOps:
        - Toevoegen AI/ELK stack en Keycloak (06/12/2024)
    - DevOps -> Dev:
        - Updated deployment files (10/12/2024)
- Sprint 3:
    - Dev -> DevOps:
        - Finale images (01/01/2025)
    - DevOps -> DevOps:
        - Finale deployment files (03/01/2025)

## Contactpersonen
- Team 5:
    - ISB: `Wolf Van Den Zegel`
    - Dev:
- Team 6:
    - ISB: `Raven Lots`
    - Dev:
- Team 9:
    - ISB: `Elias De Hondt`
    - Dev:
- Team 20:
    - ISB: `Dante Vuijst`
    - Dev:

## Communicatie
- Discord:
    - Verschillende private kanalen per dev team
    - DevOps kan alle kanalen zien
