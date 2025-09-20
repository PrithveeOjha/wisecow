# Wisecow Application Deployment
* * * * *
This repository contains the Wisecow application and all the necessary artifacts to deploy it to a Kubernetes cluster with a complete CI/CD pipeline and secure TLS communication.

### Project Overview

This project focuses on completing **Problem Statement 1** of the assessment, which involves containerizing and deploying the Wisecow application to a Kubernetes cluster. The key requirements met are:

-   **Dockerization:** The application is containerized into a Docker image.

-   **Kubernetes Deployment:** Kubernetes manifests are used to deploy the application.

-   **CI/CD Pipeline:** A GitHub Actions workflow automates the build, push, and deployment process.

-   **TLS Implementation:** Secure communication is enabled using a TLS certificate.

### Project Artifacts

The following artifacts have been created and committed to this repository:

#### 1\. Dockerfile

A **`Dockerfile`** is located in the root directory. It builds the container image for the Wisecow application by:

-   Using an Ubuntu base image.

-   Installing required dependencies (`cowsay` and `fortune-mod`).

-   Copying the `wisecow.sh` script into the image.

#### 2\. Kubernetes Manifests

The **`k8s/`** directory contains all the Kubernetes manifest files for deployment.

-   **`deployment.yaml`**: Defines the Kubernetes Deployment, which ensures a single replica of the application is running.

-   **`service.yaml`**: Defines a `ClusterIP` service to expose the Wisecow application internally to the NGINX Ingress Controller.

-   **`issuer.yaml`**: Defines a `ClusterIssuer` for `cert-manager` to issue a self-signed TLS certificate.

-   **`ingress.yaml`**: Configures the NGINX Ingress Controller to manage external traffic, **terminate TLS using `cert-manager`**, and route requests to the Wisecow service.

#### 3\. GitHub Actions CI/CD Pipeline

The **`.github/workflows/ci-cd.yml`** file contains a GitHub Actions workflow that automates the entire CI/CD process. The workflow:

-   **Builds and Pushes** a new Docker image to Docker Hub whenever changes are pushed to the `main` branch.

-   **Provisions a Temporary Kubernetes Cluster** using Minikube on the GitHub Actions runner.

-   **Installs Required Addons** such as NGINX Ingress and `cert-manager` on the ephemeral cluster.

-   **Deploys** the Wisecow application using the Kubernetes manifest files.

### How to Run the Project

1.  **Fork** this repository.

2.  **Add GitHub Secrets**: In your forked repository, go to **Settings > Secrets and variables > Actions** and add secrets for your Docker Hub username (`DOCKER_USERNAME`) and password (`DOCKER_PASSWORD`).

3.  **Push Changes**: Commit your changes and push them to the `main` branch. This will automatically trigger the GitHub Actions workflow, which will handle the container build, push, and Kubernetes deployment.
