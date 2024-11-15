############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/02/2024        #
############################

# Create a new directory
New-Item -ItemType Directory -Path "localrepo"

# Navigate to the new directory
Set-Location "localrepo"

# Clone the repository
git clone https://gitlab.com/kdg-ti/integratieproject-2/2024-2025/devops4/integrationproject2-deployment.git

# Navigate to the directory
Set-Location "integrationproject2-deployment"

# Push the repository to the GitHub mirror
git push --mirror https://github.com/EliasDeHondt/IntegrationProject2-Deployment.git

# Navigate back to the parent directory
Set-Location ..

# Go up one level
Set-Location ..

# Remove the local repository
Remove-Item -Recurse -Force "localrepo"