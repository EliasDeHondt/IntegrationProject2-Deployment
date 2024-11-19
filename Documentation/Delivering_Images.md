# 💙🤍Image Delivery using Gitlab Container Registry🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)


---


Many are used to public or limited repositories like the Dockerhub for keeping safe their container images, but when dealing with a project like this, one needs more space and/or privacy then those platforms allow.
So we have decided to use the Gitlab Container Registry, an image repository build directly into your Gitlab project. Written below are a few very simple steps one should follow when delivering us those images.

**Important Notice** The deliverables should be present in the your repository and we as your DevOps team should have access to this registry to allow us to test these images.


1. Authenticate with the Gitlab Project
Gitlab of course requires authentication to add, modify or remove any images to this repository. Login docker within your shell environment. You do this by providing an Access Token.

```
TOKEN=<token>
echo "$TOKEN" | docker login registry.example.com -u <username> --password-stdin
```

2. Build your image and push it to your registry
```
docker build -t registry.example.com/group/project/image .
docker push registry.example.com/group/project/image
```

To get the registry link, navigate to your projects' Container Registry (Deploy > Container Registry) and copy the command with included link listed there. 
For example: 1registry.gitlab.com/kdg-ti/integratieproject-infinity/2100-2101/devopsinfinity/integrationprojectinfinity-deployment`