import "encoding/yaml"

// Define the nginx deployment
deployment: {
  apiVersion: "apps/v1"
  kind:       "Deployment"
  metadata: name: "nginx-deployment"
  spec: {
    replicas: 3
    selector: matchLabels: app: "nginx"
    template: {
      metadata: labels: app: "nginx"
      spec: {
        containers: [{
          name:  "nginx"
          image: "nginx:latest"
          ports: [{ containerPort: 80 }]
        }]
      }
    }
  }
}

// Define the nginx service
service: {
  apiVersion: "v1"
  kind:       "Service"
  metadata: name: "nginx-service"
  spec: {
    selector: app: "nginx"
    ports: [{
      port:       80
      targetPort: 80
    }]
    type: "Cluster"
  }
}

// Output the deployment and service as YAML
output: yaml.MarshalStream([deployment, service])