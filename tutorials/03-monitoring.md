# 03-monitoring.md

# Monitoring Your DevOps Playground

## Overview

The playground includes a comprehensive monitoring setup with:
- Prometheus for metrics collection
- Grafana for visualization
- Kubernetes metrics server

## Accessing Monitoring Tools

### 1. Grafana

Access Grafana dashboard:
```bash
minikube service grafana -n monitoring --url
```

Default credentials:
- Username: admin
- Password: admin

### 2. Prometheus

Access Prometheus UI:
```bash
minikube service prometheus-server -n monitoring --url
```

## Key Metrics to Monitor

### 1. Node Metrics
- CPU usage
- Memory usage
- Disk I/O
- Network I/O

### 2. Pod Metrics
- CPU usage per pod
- Memory usage per pod
- Network traffic
- Container restarts

### 3. Application Metrics
- Request rate
- Error rate
- Response times
- Success rate

## Setting Up Dashboards

### 1. Default Kubernetes Dashboards

Import these Grafana dashboard IDs:
- 315 (Kubernetes Cluster Monitoring)
- 7249 (Kubernetes Cluster)
- 8588 (Kubernetes Pod Metrics)

Steps to import:
1. Go to Grafana
2. Click '+ Import'
3. Enter the dashboard ID
4. Select Prometheus as the data source
5. Click Import

### 2. Creating Custom Dashboards

To create a custom dashboard:
1. Click '+ Create' in Grafana
2. Select 'Add new panel'
3. Choose metrics to display
4. Configure visualization
5. Save dashboard

## Setting Up Alerts

### 1. Configure Alert Rules in Grafana

Example alert for high CPU usage:
1. Edit panel
2. Go to Alert tab
3. Configure:
   - Condition: avg() of query(A) > 80
   - Evaluate every: 1m
   - For: 5m

### 2. Configure Alert Notifications

Setup notification channels:
1. Go to Alerting > Notification channels
2. Add channel (Email, Slack, etc.)
3. Configure notification settings
4. Test notification

## Best Practices

1. **Resource Monitoring**
   - Set up alerts for resource constraints
   - Monitor trends over time
   - Keep historical data for capacity planning

2. **Application Monitoring**
   - Monitor application-specific metrics
   - Set up error rate alerts
   - Track response times

3. **Log Monitoring**
   - Centralize logs
   - Set up log-based alerts
   - Maintain searchable log history

4. **Alert Management**
   - Set meaningful thresholds
   - Avoid alert fatigue
   - Document alert response procedures