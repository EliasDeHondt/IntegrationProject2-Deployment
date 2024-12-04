![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Compose🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [📝Vereisten](#📝vereisten)
3. [✨Steps](#✨steps)
      - [👉Step 1: Check if Docker and Docker Compose are installed](#👉step-1-check-if-docker-and-docker-compose-are-installed)
      - [👉Step 2: Select a file](#👉step-2-select-a-file)
      - [👉Step 3: Start the desired services](#👉step-3-start-the-desired-services)
      - [👉Step 4: Check the status of containers](#👉step-4-check-the-status-of-containers)
      - [👉Step 5: Stopping services](#👉step-5-stopping-services)
      - [👉Step 6: Erase data](#👉step-6-erase-data)

## 📝Vereisten
- **Docker Compose** version ≥ 2.23.1
- **For Windows and Mac:** enable host networking in Docker Desktop > Settings > Resources > Network > enable host networking

## ✨Steps

> **Note**: Fill in the correct environment variables in the .env file and starting services with Docker Compose

### 👉Step 1: Check if Docker and Docker Compose are installed

- To check the versions, run the following commands:

```bash
docker --version
docker compose version
```

> **Note**: The Docker Compose version must be at least **2.23.1**.

### 👉Step 2: Select a file

- Choose the correct Compose file:
   - [compose-base.yaml](/Compose/compose-base.yaml) -> database, keycloak
   - [compose-app.yaml](/Compose/compose-app.yaml) -> frontend, backend, database, keycloak
   - [compose-elk.yaml](/Compose/compose-elk.yaml) -> frontend, backend, database, keycloak, elk
   - [compose-ai.yaml](/Compose/compose-ai.yaml) -> frontend, backend, database, keycloak, ai
   - [compose-full.yaml](/Compose/compose-full.yaml) -> frontend, backend, database, keycloak, elk, ai

### 👉Step 3: Start the desired services

```bash
docker compose -f <bestandsnaam> pull 
docker compose -f <bestandsnaam> up -d # Example: docker compose -f compose-full.yml up -d
```

### 👉Step 4: Check the status of containers

```bash
docker ps
docker compose -f <bestandsnaam> logs -f # Example: docker compose -f compose-full.yml logs
```

### 👉Step 5: Stopping services

- To stop all containers:
```bash
docker compose -f <bestandsnaam> down # Example: docker compose -f compose-full.yml down
```

### 👉Step 6: Erase data

- Erase specific data volumes using the following commands:
```bash
docker volume rm ip2_local_db_data        # PostgreSQL data
docker volume rm ip2_local_es_data        # Elasticsearch data
docker volume rm ip2_local_mqtt_data      # RabbitMQ data
```