FROM alpine:latest

# Install Helm and Kubernetes tools
RUN apk add --no-cache curl bash kubectl \
    && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Copy Kubernetes/Helm files into the container
WORKDIR /app
COPY . .

# Set up Helm or kubectl commands to apply your manifests
CMD ["helm", "install", "my-release", "/app/my-chart.tgz"]

