# Use a lightweight base image
FROM alpine:latest

# Install dependencies: curl, bash, kubectl, and Helm
RUN apk add --no-cache curl bash kubectl \
    && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Set the working directory inside the container
WORKDIR /app

# Copy your Helm chart and Kubernetes YAML files into the container
COPY . .

# Set environment variables for Kubernetes namespace (optional, modify as needed)
ENV NAMESPACE=default

# Command to deploy the Helm chart and apply Kubernetes YAML files
CMD ["sh", "-c", "helm upgrade --install myreactapp . "]

