#!/bin/bash
###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################

########################### TEAM05 ###########################
# Pull images from GitLab registry
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/react-frontend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/spring-backend:latest

# Tag and push images to GitHub Container Registry
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/react-frontend:latest ghcr.io/eliasdehondt/team5-ip2-frontend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/spring-backend:latest ghcr.io/eliasdehondt/team5-ip2-backend:latest

# Push images to GitHub Container Registry
sudo docker push ghcr.io/eliasdehondt/team5-ip2-frontend:latest
sudo docker push ghcr.io/eliasdehondt/team5-ip2-backend:latest

# Remove images from local machine
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/react-frontend:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team5/spring-backend:latest
########################### TEAM05 ###########################

########################### TEAM06 ###########################
# Pull images from GitLab registry
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/frontend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-game-service/spring-backend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/app:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/ollama:latest

# Tag and push images to GitHub Container Registry
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/frontend:latest ghcr.io/eliasdehondt/team6-ip2-frontend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-game-service/spring-backend:latest ghcr.io/eliasdehondt/team6-ip2-backend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/app:latest ghcr.io/eliasdehondt/team6-ip2-ai:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/ollama:latest ghcr.io/eliasdehondt/team6-ip2-ollama:latest

# Push images to GitHub Container Registry
sudo docker push ghcr.io/eliasdehondt/team6-ip2-frontend:latest
sudo docker push ghcr.io/eliasdehondt/team6-ip2-backend:latest
sudo docker push ghcr.io/eliasdehondt/team6-ip2-ai:latest
sudo docker push ghcr.io/eliasdehondt/team6-ip2-ollama:latest

# Remove images from local machine
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/frontend:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-game-service/spring-backend:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/app:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team6/backend-ai-service/ollama:latest
########################### TEAM06 ###########################

########################### TEAM09 ###########################
# Pull images from GitLab registry
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:local
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:production
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-game-service/spring-backend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-ai-service/python-ai:latest

# Tag and push images to GitHub Container Registry
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:local ghcr.io/eliasdehondt/team9-ip2-frontend:compose
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:production ghcr.io/eliasdehondt/team9-ip2-frontend:kubernetes
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-game-service/spring-backend:latest ghcr.io/eliasdehondt/team9-ip2-backend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-ai-service/python-ai:latest ghcr.io/eliasdehondt/team9-ip2-ai:latest

# Push images to GitHub Container Registry
sudo docker push ghcr.io/eliasdehondt/team9-ip2-frontend:compose
sudo docker push ghcr.io/eliasdehondt/team9-ip2-frontend:kubernetes
sudo docker push ghcr.io/eliasdehondt/team9-ip2-backend:latest
sudo docker push ghcr.io/eliasdehondt/team9-ip2-ai:latest

# Remove images from local machine
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:local
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/frontend/react-frontend:production
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-game-service/spring-backend:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team9/backend-ai-service/python-ai:latest
########################### TEAM09 ###########################

########################### TEAM20 ###########################
# Pull images from GitLab registry
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/frontend/react-frontend-isb:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-game-service/spring-backend:latest
sudo docker pull registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-ai-service/python-ai:latest

# Tag and push images to GitHub Container Registry
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/frontend/react-frontend-isb:latest ghcr.io/eliasdehondt/team20-ip2-frontend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-game-service/spring-backend:latest ghcr.io/eliasdehondt/team20-ip2-backend:latest
sudo docker tag registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-ai-service/python-ai:latest ghcr.io/eliasdehondt/team20-ip2-ai:latest

# Push images to GitHub Container Registry
sudo docker push ghcr.io/eliasdehondt/team20-ip2-frontend:latest
sudo docker push ghcr.io/eliasdehondt/team20-ip2-backend:latest
sudo docker push ghcr.io/eliasdehondt/team20-ip2-ai:latest

# Remove images from local machine
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/frontend/react-frontend-isb:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-game-service/spring-backend:latest
sudo docker rmi registry.gitlab.com/kdg-ti/integratieproject-2/2024-2025/team20/backend-ai-service/python-ai:latest
########################### TEAM20 ###########################