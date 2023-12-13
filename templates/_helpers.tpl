# Frontend
{{- define "frontend.deployment.name" -}}
{{- printf "frontend-deployment" }}
{{- end }}

{{- define "frontend.deployment.labels" -}}
app: {{- printf " frontend" -}}
{{- end -}}

{{- define "frontend.service.name" -}}
{{- printf "frontend-service" -}}
{{- end }}

# Backend 
{{- define "backend.deployment.name" -}}
{{- printf "backend-deployment" }}
{{- end }}

{{- define "backend.deployment.labels" -}}
app: {{- printf " backend" -}}
{{- end -}}

{{- define "backend.service.name" -}}
{{- printf "backend-service" -}}
{{- end }}

# mongo db
{{- define "mongo.stateful.name" -}}
{{- printf "mongodb" }}
{{- end }}

{{- define "mongo.deployment.selectorLabels" -}}
app: {{ printf "mongodb" }}
{{- end}}

{{- define "mongo.service.name" }}
{{- printf "mongodb-service"}}
{{- end}}

# Alertmanager
{{- define "alertmanager.config.name" -}}
{{- printf "alertmanager-config" }}
{{- end -}}

{{- define "alertmanager.deployment.name" -}}
{{- printf "alertmanager" -}}
{{- end -}}

{{- define "alertmanager.deployment.labels" -}}
app: {{- printf " alertmanager" -}}
{{- end -}}

{{- define "alertmanager.service.name" -}}
{{- printf "alertmanager-service" -}}
{{- end }}

# config map

{{- define "configMap.name" -}}
{{- printf "application-config" -}}
{{- end -}}

# Grafana 

{{- define "grafana.deployment.name" -}}
{{- printf "grafana" -}}
{{- end -}}

{{- define "grafana.deployment.labels" -}}
app: {{- printf " grafana" -}}
{{- end -}}

{{- define "grafana.service.name" -}}
{{- printf "grafana-service" -}}
{{- end }}

{{- define "hpa.name" -}}
{{- printf "backend-hpa" -}}
{{- end }}

{{- define "ingress.name" -}}
{{- printf "ingress" -}}
{{- end }}

{{- define "ingress.annotations" -}}
kubernetes.io/ingress.class: {{ printf "nginx" }}
{{- end }}

{{- define "ingress.rules" -}}
- host: avesair.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "frontend.service.name" .}}
            port: 
              number: {{ .Values.frontend.service.port }}
- host: backend.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "backend.service.name" . }}
            port: 
              number: {{ .Values.backend.service.port }}
- host: prometheus.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "prometheus.deployment.name" . }}
            port: 
              number: {{ .Values.prometheus.service.port }}
- host: grafana.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "grafana.service.name" . }}
            port: 
              number: {{ .Values.grafana.service.port }}


{{- end }}

{{- define "mongo.job.name" -}}
name: {{ printf "mongodb-replica-set-config" }}
{{- end}}

{{- define "storageclass.name" -}}
{{ printf "aws-efs-sc" }}
{{- end}}

{{- define "stress.job.name" -}}
name: {{ printf "stress-job" }}
{{- end}}

{{- define "kube.state.metrics.name" -}}
{{ printf "%s" .Values.kubeStateMetrics.name }}
{{- end}}

{{- define "kube.state.metrics.service.name" -}}
{{ printf "kube-state-metrics-service"}}
{{- end}}

{{- define "kube.state.metrics.selectorLabels" -}}
k8s-app: {{ printf "kube-state-metrics" }}
{{- end}}

{{- define "network.policy.name" -}}
{{ printf "database-access"}}
{{- end}}

{{- define "node.exporter.name" -}}
{{ printf "prometheus-node-exporter" }}
{{- end}}

{{- define "node.exporter.selectorLabels" -}}
k8s-app: {{ printf "prometheus-node-exporter"}}
{{- end}}

{{- define "prometheus.deployment.name" -}}
{{ printf "prometheus" }}
{{- end}}

{{- define "prometheus.deployment.selectorLabel" -}}
app: {{ printf "prometheus" }}
{{- end}}

{{- define "mongo.pv.name1" -}}
{{ printf "mongo-pv-1" }}
{{- end}}

{{- define "mongo.pv.name2" -}}
{{ printf "mongo-pv-2" }}
{{- end}}

{{- define "mongo.pv.name3" -}}
{{ printf "mongo-pv-3" }}
{{- end}}

{{- define "secret.store.name" -}}
{{ printf "eks-secret-store" }}
{{- end}}

{{- define "external.secret.name" -}}
{{ printf "eks-external-secret" }}
{{- end}}

{{- define "external.secret.secret.name" -}}
{{ printf "application-secrets"}}
{{- end}}

{{- define "docker.credentials.name" -}}
{{ printf "docker-repo"}}
{{- end}}
