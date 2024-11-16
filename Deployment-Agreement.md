![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Deployment Agreement🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Images](#🖖images)
3. [🛸AI](#🛸ai)
4. [🌐Google Cloud Buckets & Secrets Manager](#🌐google-cloud-buckets--secrets-manager)
    1. [🌐Google Cloud Buckets](#🌐google-cloud-buckets)
    2. [🌐Google Cloud Service Accounts & Credentials](#🌐google-cloud-service-accounts--credentials)
    3. [🌐Google Cloud Secrets Manager](#🌐google-cloud-secrets-manager)
    4. [🌐Unified Access via Service Account](#🌐unified-access-via-service-account)
    5. [🌐Conclusie](#🌐conclusie)
5. [📅Deadlines](#📅deadlines)
6. [👌Contactpersonen](#👌contactpersonen)
7. [✉️Communicatie](#✉️communicatie)

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
        - ELK Stack:
            - Name: `elk-stack`
            - Port: `5601`
    - Pod 6:
        - Monitoring Grafana:
            - Name: `grafana`
            - Port: `3000`

- Database PostgreSQL
    - Name: `database-postgresql`
    - Port: `5432`

- Registry
    - `Gitlab Container Registry`

## 🛸AI

- Aanvullende informatie voor AI-studenten:
    - Er zal een Docker-image worden geleverd waarin een Python-runtime draait, inclusief eventueel een zelfgetrainde AI.

    - Jullie kunnen deze AI lokaal trainen op eigen machines of, indien meer rekenkracht nodig is, in de cloud met credits uit jullie eigen project.

    - De getrainde AI dient te worden opgenomen in de `Docker-image`. Let op dat de naamgeving en poorten correct zijn, zodat uniforme implementatie mogelijk blijft voor alle vier de teams.

    - Hoewel een Python-runtime standaard wordt meegeleverd, is dit niet verplicht. Zorg er echter voor dat de functionaliteit en configuratie in lijn blijven met de opgegeven restricties en standaarden, omdat dit van ons wordt verwacht.

## 🌐Google Cloud Buckets & Secrets Manager

### 🌐Google Cloud Buckets

- Wat zijn Google Cloud Buckets?
    - Google Cloud Storage Buckets zijn opslagruimtes waarin je objecten zoals foto's, video's of andere bestanden kunt bewaren. Deze buckets zijn ideaal om mediabestanden te hosten die kunnen worden gebruikt in je frontend en andere services, zowel lokaal als in productieomgevingen.

- Voorbeeld: Bucket aanmaken en configureren
    - Gebruik het volgende commando in Bash of PowerShell om een bucket te maken in Google Cloud:
    ```bash
    # Pas de nodige variabelen aan.
    gsutil mb -l europe-west1 -b on gs://<bucket-naam>/
    gsutil mb -l europe-west1 -b on gs://team9-media-bucket/
    gsutil cp /pad/naar/foto.jpg gs://team9-media-bucket/
    gsutil iam ch allUsers:objectViewer gs://team9-media-bucket
    ```

- Integratie met de frontend
    - Je kunt bestanden vanuit de bucket direct in je frontend gebruiken door hun publieke URL's te integreren in je applicatie. Bijvoorbeeld:
    ```html
    <img src="https://storage.googleapis.com/team9-media-bucket/foto.jpg" alt="Foto" />
    ```

### 🌐Google Cloud Service Accounts & Credentials

- Voor test- en productieomgevingen is het noodzakelijk dat een service account wordt gemaakt met de juiste rechten om toegang te krijgen tot de bucket.

- Service Account aanmaken en exporteren:
    1. Maak een service account aan:
    ```bash
    gcloud iam service-accounts create team9-bucket-access \
    --description="Access account voor bucket en secrets" \
    --display-name="Team 9 Bucket Access"
    ```
    2. Ken rechten toe aan het service account:
    ```bash
    gcloud projects add-iam-policy-binding <project-id> \
    --member="serviceAccount:team9-bucket-access@<project-id>.iam.gserviceaccount.com" \
    --role="roles/storage.admin"
    ```
    3. Genereer en download een JSON-sleutel:
    ```bash
    gcloud iam service-accounts keys create ./team9-bucket-credentials.json \
    --iam-account=team9-bucket-access@<project-id>.iam.gserviceaccount.com
    ```
    4. Gebruik de JSON-sleutel in je applicatie:
    ```bash
    kubectl create secret generic gcs-credentials \
    --from-file=key.json=./team9-bucket-credentials.json
    ```

### 🌐Google Cloud Secrets Manager

- Wat is Google Cloud Secrets Manager?
    - Dit is een beveiligde manier om gevoelige gegevens, zoals API-sleutels, wachtwoorden en tokens, te beheren. Met de Secrets Manager kun je eenvoudig toegang geven aan services en gebruikers terwijl gevoelige gegevens veilig blijven.

- Secrets aanmaken en beheren
    1. Secret aanmaken:
    ```bash
    gcloud secrets create team9-database-password \
    --replication-policy="automatic"
    ```
    2. Gegevens aan het secret toevoegen:
    ```bash
    echo "SterkWachtwoord123!" | gcloud secrets versions add team9-database-password --data-file=-
    ```
    3. Toegang verlenen aan het service account:
    ```bash
    gcloud secrets add-iam-policy-binding team9-database-password \
    --member="serviceAccount:team9-bucket-access@<project-id>.iam.gserviceaccount.com" \
    --role="roles/secretmanager.secretAccessor"
    ```
    4. Secret ophalen in je applicatie:
    ```bash
    gcloud secrets versions access latest --secret="team9-database-password"
    ```

### 🌐Unified Access via Service Account
- Een enkel service account kan zowel toegang krijgen tot een Google Cloud Bucket als tot Secrets Manager. Je hoeft enkel de benodigde rollen toe te wijzen:

- **Voor de Bucket:** `roles/storage.admin`
- **Voor Secrets Manager:** `roles/secretmanager.secretAccessor`

- Rollen toewijzen:
```bash
gcloud projects add-iam-policy-binding <project-id> \
    --member="serviceAccount:team9-bucket-access@<project-id>.iam.gserviceaccount.com" \
    --role="roles/storage.admin"

gcloud projects add-iam-policy-binding <project-id> \
    --member="serviceAccount:team9-bucket-access@<project-id>.iam.gserviceaccount.com" \
    --role="roles/secretmanager.secretAccessor"
```

### 🌐Conclusie
- **Buckets:** `Gebruik voor opslag van media zoals video's en foto's.`
- **Secrets Manager:** `Beveilig gevoelige gegevens zoals API-sleutels.`
- **Service Account:** `Eén enkel account kan beide toegangspunten beheren. Zorg ervoor dat credentials gedeeld worden met DevOps voor testing en deployment.`

## ✅Deadlines
- Sprint 1:
    - Dev -> DevOps:
        - Dummy images **(19/11/2024)**
        - Connectiviteit tussen containers Frontend, Backend, Database **(22/11/2024)**
    - DevOps -> Dev:
        - Deployment files, zowel lokaal als cloud **(26/11/2024)**
- Sprint 2:
    - Dev -> DevOps:
        - Toevoegen AI/ELK stack en Keycloak **(06/12/2024)**
    - DevOps -> Dev:
        - Updated deployment files **(10/12/2024)**
- Sprint 3:
    - Dev -> DevOps:
        - Finale images **(01/01/2025)**
    - DevOps -> DevOps:
        - Finale deployment files **(03/01/2025)**

## 👌Contactpersonen
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

## ✉️Communicatie
- Discord:
    - Verschillende private kanalen per dev team
    - DevOps kan alle kanalen zien

---

![Network Schema](/Images/Network-Schema.png)