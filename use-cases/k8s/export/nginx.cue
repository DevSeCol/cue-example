import "encoding/yaml"
_environments: ["dev","tst","prd"]

for env in _environments {
  // Define the nginx deployment
  "deployment_\(env)": {
    apiVersion: "apps/v1"
    kind:       "Deployment"
    metadata: {
      name: "nginx-deployment"
      namespace: env 
    }
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
  "service_\(env)": {
    apiVersion: "v1"
    kind:       "Service"
    metadata: {
      name: "nginx-service"
      namespace: env 
    }
    spec: {
      selector: app: "nginx"
      ports: [{
        port:       80
        targetPort: 80
      }]
      type: "ClusterIP"
    }
  }
}