![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Delivering Images🤍💙

While many are accustomed to public or restricted repositories like Docker Hub for storing container images, larger projects often require more space and privacy than these platforms can offer.

For this reason, we’ve chosen to use GitLab’s Container Registry, a secure image repository integrated directly into your GitLab project. Below are the simple steps to follow for delivering your images.

**Important Reminder**: Your deliverables must be available in your repository, and our DevOps team needs access to this registry to facilitate image testing.

---

1. Authenticate with GitLab
- GitLab requires authentication to add, modify, or delete images in the container registry. To authenticate, log in to Docker in your shell environment using an Access Token.

```bash
TOKEN=<token>
echo "$TOKEN" | docker login registry.example.com -u <username> --password-stdin
```

2. Build and Push Your Image to the Registry
- After authenticating, you can build and push your image to the registry.

```bash
docker build -t registry.example.com/group/project/image .
docker push registry.example.com/group/project/image
```

- To find your registry URL, navigate to your project’s Container Registry section (Deploy > Container Registry), where you'll find the command with the corresponding URL. For example: `registry.gitlab.com/kdg-ti/integratieproject-infinity/2100-2101/devopsinfinity/integrationprojectinfinity-deployment`