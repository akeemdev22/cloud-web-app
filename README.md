# Cloud Web App on AWS

## Overview

A static website running in a Docker container with Nginx. The plan is to deploy it to AWS ECS Fargate using Terraform, with GitHub Actions handling the deployments.

The website is a free template. The work in this project is the Docker, AWS, Terraform and pipeline side.

## Features

- Website runs inside a Docker container using Nginx
- Container runs as a normal user instead of root
- Image is built for linux/amd64 so it can run on AWS Fargate
- Health check inside the container to confirm the site is up
- Terraform state files are kept out of Git

## Technologies

- Docker
- Nginx
- Git and GitHub
- Terraform
- AWS (ECS Fargate, ECR, VPC, Load Balancer, IAM, CloudWatch, S3)
- GitHub Actions

## Project Structure

```
cloud-web-app/
  app/
    site/          website files
    Dockerfile
  terraform/       infrastructure code
  .github/
    workflows/     pipelines
  docs/            screenshots
```

## How to Run Locally

Docker needs to be installed.

```bash
cd app
docker build --platform linux/amd64 -t cloud-web-app:local .
docker run -d -p 8080:8080 --name cloud-web-app cloud-web-app:local
```

Then open http://localhost:8080

To stop it:

```bash
docker stop cloud-web-app && docker rm cloud-web-app
```

![Website running locally](docs/website-local.png)

## Progress

- [x] Website running in Docker
- [ ] Terraform state bucket in S3
- [ ] AWS infrastructure built with Terraform
- [ ] Website deployed to ECS Fargate
- [ ] GitHub Actions pipeline

## Issues I Ran Into

The AWS CLI gave a SignatureDoesNotMatch error. The region had been saved as "Eu-north-1" and the output as "Json" with capital letters. AWS