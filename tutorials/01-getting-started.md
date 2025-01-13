# 01-getting-started.md

# Getting Started with DevOps Playground

## Prerequisites
- Linux/macOS operating system
- At least 4GB of RAM available
- Docker installed
- Internet connection

## Initial Setup

### 1. Install Required Tools

The setup script (`scripts/setup.sh`) will automatically install these for you, but here's what's happening behind the scenes:

```bash
# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl
```

### 2. Start the Environment

Run the setup script:
```bash
./scripts/setup.sh
```

This script will:
- Start Minikube
- Enable necessary addons
- Install Helm
- Deploy monitoring tools
- Set up the web terminal
- Deploy sample applications

### 3. Verify Installation

Check that everything is running:
```bash
# Check all pods
kubectl get pods --all-namespaces

# Check services
kubectl get services --all-namespaces

# Check Minikube addons
minikube addons list
```

### 4. Access the Dashboard

The Kubernetes Dashboard provides a web UI for managing your cluster:
```bash
minikube dashboard
```

### 5. Using the Web Terminal

Access the web-based terminal:
```bash
minikube service ttyd --url
```

This will give you a URL to access the terminal in your browser.

### 6. Troubleshooting

Common issues and solutions:

1. **Minikube won't start**
   - Ensure virtualization is enabled in BIOS
   - Check if you have enough memory
   - Try running: `minikube delete && minikube start`

2. **Services not accessible**
   - Use `minikube service <service-name> --url` to get the correct URL
   - Check if the service is running: `kubectl get svc`
   - Check pod logs: `kubectl logs <pod-name>`

3. **Resource constraints**
   - Adjust Minikube resources: `minikube config set memory 4096`
   - Adjust Minikube CPU: `minikube config set cpus 2`