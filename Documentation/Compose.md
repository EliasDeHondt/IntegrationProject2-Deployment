# Documentatie Docker Compose

## Vereisten
- **Docker Compose** versie ≥ 2.23.1.

---

## **1. Vul de juiste environment variabelen in in de .env file**
## **2. Services starten met Docker Compose**

1. **Controleer of Docker en Docker Compose geïnstalleerd zijn**  
   Voer de volgende commando's uit om de versies te controleren:
   ```bash
   docker --version
   docker compose version
   ```
   > **Let op**: de Docker Compose-versie moet minimaal **2.23.1** zijn.

2. **Selecteer een bestand**  
   Kies het juiste Compose-bestand:
   - compose-base -> database, keycloak
   - compose-app -> frontend, backend, database, keycloak
   - compose-elk -> frontend, backend, database, keycloak, elk
   - compose-ai -> frontend, backend, database, keycloak, ai

3. **Start de gewenste services**
   ```bash
   docker compose -f <bestandsnaam> up -d
   ```  
   Voorbeeld:
   ```bash
   docker compose -f compose-full.yml up -d
   ```

4. **Controleer de status van containers**
   ```bash
   docker ps
   docker compose -f <bestandsnaam> logs
   ```

5. **Services stoppen**  
   Om alle containers te stoppen:
   ```bash
   docker compose -f <bestandsnaam> down
   ```

6. **Data wissen**  
   Wis specifieke data-volumes met de volgende commando's:
   ```bash
   docker volume rm ip2_local_db_data        # PostgreSQL data
   docker volume rm ip2_local_es_data        # Elasticsearch data
   docker volume rm ip2_local_mqtt_data      # RabbitMQ data
   ```

---

