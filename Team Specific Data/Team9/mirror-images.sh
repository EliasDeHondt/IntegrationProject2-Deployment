#!/bin/bash
###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################

# Pull images from GitLab registry
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-game-service/spring-backend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-ai-service/python-ai:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:local
sudo docker pull  registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:production

# Tag and push images to GitHub Container Registry
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-game-service/spring-backend:latest ghcr.io/eliasdehondt/team9-ip2-backend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-ai-service/python-ai:latest ghcr.io/eliasdehondt/team9-ip2-ai:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:local ghcr.io/eliasdehondt/team9-ip2-frontend:compose
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:production ghcr.io/eliasdehondt/team9-ip2-frontend:kubernetes

# Push images to GitHub Container Registry
sudo docker push ghcr.io/eliasdehondt/team9-ip2-backend:latest
sudo docker push ghcr.io/eliasdehondt/team9-ip2-ai:latest
sudo docker push ghcr.io/eliasdehondt/team9-ip2-frontend:compose
sudo docker push ghcr.io/eliasdehondt/team9-ip2-frontend:kubernetes