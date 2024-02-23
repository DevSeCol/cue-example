_schema: {

	apiVersion: "v1"
	kind:       "Service"

	metadata: {
		name: string
		namespace: "dev" | "test"
	}

	spec: {
		type: "LoadBalancer"
		ports: [{
			name:       "http-port"
			protocol:   "TCP"
			port:       int
			targetPort: int
		}]
	}

}
test: _schema
test: { 
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "test-nginx-service"
		namespace: "test"
	}
	spec: {
		type: "LoadBalancer"
		ports: [{
			name:       "http-port"
			protocol:   "TCP"
			port:       80
			targetPort: 80
		}]
	}
} 