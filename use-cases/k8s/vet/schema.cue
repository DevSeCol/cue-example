#Schema: #deploymentType

// Define a type for Kubernetes container ports
#containerPortType: {
	containerPort: int
}

// Define a type for Kubernetes containers
#containerType: {
	name:  string
	image: string
	ports: [...#containerPortType]
}

// Define a type for Kubernetes pod template specs
#templateSpecType: {
	metadata: {
		labels: [string]: string
	}
	spec: {
		containers: [...#containerType]
	}
}

// Define a type for Kubernetes label selectors
#labelSelectorType: {
	matchLabels: [string]: string
}

// Define a type for Kubernetes Deployment specs
#deploymentSpecType: {
	replicas: int
	selector: #labelSelectorType
	template: #templateSpecType
}

// Define a type for Kubernetes Deployment metadata
#metadataType: {
	name: string
}

// Define a type for Kubernetes Deployment objects
#deploymentType: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #metadataType
	spec:       #deploymentSpecType
}