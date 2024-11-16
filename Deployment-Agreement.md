![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Deployment Agreement🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [📝Uniformity Across Developer Teams](#📝uniformity-across-developer-teams)
3. [🛸Artificial Intelligence (AI)](#🛸artificial-intelligence-ai)
4. [🌐Google Cloud Buckets & Secrets Manager](#🌐google-cloud-buckets--secrets-manager)
    - [🌐Google Cloud Buckets](#🌐google-cloud-buckets)
    - [🌐Google Cloud Secrets Manager](#🌐google-cloud-secrets-manager)
5. [📅Deadlines](#📅deadlines)
6. [👌Points of Contact](#👌points-of-contact)
7. [✉️Communication](#✉️communication)
8. [📊Network Architecture](#📊network-architecture)

---

## 📝Uniformity Across Developer Teams

- **Importance of Standardized Implementation:**
    - The project involves ``four distinct developer teams``, each contributing to a shared infrastructure. It is critical that all teams strictly adhere to the provided guidelines and best practices to ensure a consistent and uniform implementation. Failure to do so may result in compatibility issues where certain functionalities fail to work correctly in some applications, undermining the overall project success.

- **Unified Infrastructure:**
    - The infrastructure is designed to support a single, standardized configuration that serves the needs of all teams without requiring custom modifications for specific use cases. Individual changes or deviations to accommodate unique requirements are not permitted. Such modifications can compromise the uniformity and reliability of the system, creating unnecessary complexity and potential failures.

- **Collaboration and Communication:**
    - To maintain alignment:
        - `Open Dialogue`: Developer teams are encouraged to collaborate and discuss their requirements with one another and with DevOps.
        - `Consensus-Based Changes`: Any modifications to the infrastructure must be presented, reviewed, and agreed upon by all developer teams. This ensures no team is adversely impacted by unilateral decisions.
        - `Guidance and Support`: The DevOps team is available to provide advice and ensure all implementations conform to the established standards.

- **Why Uniformity Matters:**
    - `Scalability`: A consistent infrastructure allows seamless scaling and future enhancements.
    - `Maintainability`: Uniform standards simplify troubleshooting, updates, and documentation.
    - `Cross-Team Compatibility`: Ensures that all applications, regardless of the developing team, function seamlessly within the shared ecosystem.

> By working together and adhering to these principles, we can build a robust, efficient, and scalable infrastructure that meets the needs of all teams without compromising on quality or reliability.

## 🛸Artificial Intelligence (AI)

- **Supplementary Information for AI Teams:**
    - A pre-configured Docker image containing a Python runtime environment will be supplied, optionally augmented with a custom-trained AI model.

    - Teams can train their AI locally or, if higher computational resources are necessary, utilize cloud-based resources with allocated project credits.

    - The finalized AI model must be embedded within the designated Docker image. Adherence to naming conventions and port configurations is critical to ensure seamless integration across all teams.

    - While the inclusion of a Python runtime is recommended, it is not mandatory. However, strict alignment with established functionality, configuration protocols, and project specifications is mandatory.

## 🌐Google Cloud Buckets & Secrets Manager

### 🌐Google Cloud Buckets

- **Purpose of Buckets**
    - Google Cloud Storage Buckets are scalable and highly available storage solutions designed to store various types of objects such as images, videos, and other assets. These buckets are ideal for hosting media files that can be directly accessed and used by frontend applications, both in local development and production environments.

- **Developer Workflow**
    - Developers are required to upload their media files, or other relevant assets directly to their designated Google Cloud Buckets.
    - All uploaded content should be configured with public access, allowing direct use of public URLs in frontend applications.

- **Creating and Configuring a Bucket**
    - To set up a bucket, use the following commands in a terminal (Bash or PowerShell):
    ```bash
    # Adjust the variables as needed.
    gsutil mb -l europe-west1 -b on gs://<bucket-name>/
    gsutil mb -l europe-west1 -b on gs://team9-media-bucket/
    gsutil cp /path/to/image.jpg gs://team9-media-bucket/
    gsutil iam ch allUsers:objectViewer gs://team9-media-bucket/
    ```

- **Using Public URLs in the Frontend**
    - Once the assets are uploaded and permissions (public access) are set, their public URLs can be integrated into the frontend directly. For example:
    ```html
    <img src="https://storage.googleapis.com/<bucket-name>/image.jpg" alt="Example Image" />  
    ```
    - This ensures seamless and efficient asset delivery, minimizing backend dependency while leveraging Google's global content delivery network (CDN).

- **Key Notes**
    - Public Access: Make sure to review and confirm public access permissions for each bucket to avoid unauthorized modifications.
    - Asset Management: Developers are responsible for maintaining the integrity and organization of the bucket's content. 

### 🌐Google Cloud Secrets Manager

- **Overview of Google Cloud Secrets Manager:**
    - A secure mechanism for managing sensitive information such as API keys, passwords, and tokens, ensuring confidentiality while enabling seamless access for authorized services.

- **Managing Secrets:**
    1. Create a secret:
    ```bash
    gcloud secrets create <secret-name> --replication-policy="automatic"
    ```
    2. Add data to the secret:
    ```bash
    echo "SecurePassword123!" | gcloud secrets versions add <secret-name> --data-file=-
    ```
    3. Grant access to a service account:
    ```bash
    gcloud secrets add-iam-policy-binding <secret-name> \
    --member="serviceAccount:<service-account-email>" \
    --role="roles/secretmanager.secretAccessor"
    ```
    4. Retrieve the secret in your application:
    ```bash
    gcloud secrets versions access latest --secret=<secret-name>
    ```

## 📅Deadlines

- **Sprint 1:**
    - **Dev → DevOps:**
        - Placeholder images: **19/11/2024**
        - Container connectivity: **22/11/2024**
    - **DevOps → Dev:**
        - Deployment files: **26/11/2024**
- **Sprint 2:**
    - **Dev → DevOps:**
        - AI/ELK/Keycloak integration: **06/12/2024**
    - **DevOps → Dev:**
        - Updated deployment files: **10/12/2024**
- **Sprint 3:**
    - **Dev → DevOps:**  
        - Final images: **01/01/2025**
    - **DevOps → DevOps:**
        - Final deployment files: **03/01/2025**

## 👌Points of Contact

- **Team 5:**
    - **ISB:** `Wolf Van Den Zegel`
    - **DEV:** ``
- **Team 6:**
    - **ISB:** `Raven Lots`
    - **DEV:** ``
- **Team 9:**
    - **ISB:** `Elias De Hondt`
    - **DEV:** ``
- **Team 20:**
    - **ISB:** `Dante Vuijst`
    - **DEV:** ``

## ✉️Communication

- **Discord:**
    - Private channels for each development team are available for direct communication.
    - DevOps retains overarching visibility across all channels to ensure consistent information flow and support.
    - Join with the following link: [Discord Server](https://discord.gg/N2MuvGzGZe)

## 📊Network Architecture

- **Example Domain Names:**
    - Below are the domain names used throughout our documentation to represent various services in the infrastructure:
        - `status.kdg-IP2.eliasdh.com` Points to the **Grafana** monitoring service.
        - `stack.kdg-IP2.eliasdh.com` Points to the **ELK Stack** service.
        - `keycloak.kdg-IP2.eliasdh.com` Points to the **Keycloak IAM** service.
        - `www.kdg-IP2.eliasdh.com` Points to the **React Frontend** service.

- **Kubernetes Cluster:**
    - **Pod 1:**
        - **React Frontend:** *(Image 1)*
            - **Name:** `react-frontend`
            - **Port:** `3000`
    - **Pod 2:**
        - **Keycloak Identity and Access Management (IAM):**
            - **Name:** `keycloak-iam`
            - **Port:** `8080`
        - **Cloud SQL Proxy Sidecar:**
            - **Name:** `cloud-sql-proxy`
            - **Port:** `3306`
    - **Pod 3:**
        - **Spring Backend:** *(Image 2)*
            - **Name:** `spring-backend`
            - **Port:** `8081`
        - **Cloud SQL Proxy Sidecar:**
            - **Name:** `cloud-sql-proxy`
            - **Port:** `3306`
    - **Pod 4:**
        - **Python AI Module:** *(Image 3)*
            - **Name:** `python-ai`
            - **Port:** `5000`
    - **Pod 5:**
        - **ELK Stack (Elasticsearch, Logstash, Kibana):**
            - **Name:** `elk-stack`
            - **Port:** `5601`
    - **Pod 6:**
        - **Grafana Monitoring Tool:**
            - **Name:** `grafana`
            - **Port:** `3000`

- **PostgreSQL Database:**
    - **Name:** `database-postgresql`
    - **Port:** `5432`

- **Container Registry:**
    - `GitLab Container Registry`

![Network Architecture](/Images/network-architecture.png)
