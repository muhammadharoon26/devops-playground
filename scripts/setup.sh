#!/bin/bash

# Check if minikube is installed
if ! command -v minikube &> /dev/null; then
    echo "Installing Minikube..."
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    rm minikube-linux-amd64
fi

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install kubectl /usr/local/bin/kubectl
    rm kubectl
fi

# Start Minikube
minikube start --memory=4096 --cpus=2

# Enable required addons
minikube addons enable metrics-server
minikube addons enable dashboard

# Install Helm
if ! command -v helm &> /dev/null; then
    echo "Installing Helm..."
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# Add Helm repositories
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Deploy Prometheus and Grafana
kubectl create namespace monitoring
helm install prometheus prometheus-community/prometheus --namespace monitoring -f kubernetes/monitoring/prometheus-values.yaml
helm install grafana grafana/grafana --namespace monitoring -f kubernetes/monitoring/grafana-values.yaml

# Deploy ttyd terminal
kubectl apply -f kubernetes/terminals/ttyd-deployment.yaml

# Deploy sample applications
kubectl apply -f kubernetes/sample-apps/python-app/
kubectl apply -f kubernetes/sample-apps/node-app/

echo "DevOps playground setup complete!"