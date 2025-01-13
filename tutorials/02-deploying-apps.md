# 02-deploying-apps.md

# Deploying Applications in the DevOps Playground

## Understanding the Sample Applications

The playground comes with two sample applications:
1. Python Flask application
2. Node.js Express application

### Application Structure

#### Python Application
```
python-app/
├── Dockerfile
├── app.py
└── requirements.txt
```

#### Node.js Application
```
node-app/
├── Dockerfile
├── package.json
└── server.js
```

## Building and Deploying Applications

### 1. Building Docker Images

First, set your Docker environment to use Minikube's Docker daemon:
```bash
eval $(minikube docker-env)
```

Build the Python application:
```bash
cd docker/python-app
docker build -t python-app:latest .
```

Build the Node.js application:
```bash
cd docker/node-app
docker build -t node-app:latest .
```

### 2. Deploying to Kubernetes

Deploy the applications using kubectl:
```bash
# Deploy Python app
kubectl apply -f kubernetes/sample-apps/python-app/

# Deploy Node.js app
kubectl apply -f kubernetes/sample-apps/node-app/
```

### 3. Accessing the Applications

Get the URLs for your applications:
```bash
minikube service python-app --url
minikube service node-app --url
```

### 4. Monitoring Your Deployments

Check deployment status:
```bash
kubectl get deployments
kubectl get pods
kubectl get services
```

View application logs:
```bash
kubectl logs deployment/python-app
kubectl logs deployment/node-app
```

### 5. Scaling Applications

Scale the number of replicas:
```bash
kubectl scale deployment python-app --replicas=3
kubectl scale deployment node-app --replicas=3
```

### 6. Updating Applications

To update an application:
1. Make changes to the code
2. Build a new Docker image with a new tag
3. Update the deployment with the new image:
```bash
kubectl set image deployment/python-app python-app=python-app:v2
```