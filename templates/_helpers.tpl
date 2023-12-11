# Frontend
{{- define "frontend.deployment.name" -}}
{{- printf "%s-frontend-deployment" .Release.Name }}
{{- end }}

{{- define "frontend.deployment.labels" -}}
app: {{- printf " frontend" -}}
{{- end -}}

{{- define "frontend.service.name" -}}
{{- printf "frontend-service" -}}
{{- end }}

# Backend 
{{- define "backend.deployment.name" -}}
{{- printf "%s-backend-deployment" .Release.Name }}
{{- end }}

{{- define "backend.deployment.labels" -}}
app: {{- printf " backend" -}}
{{- end -}}

{{- define "backend.service.name" -}}
{{- printf "backend-service" -}}
{{- end }}

# Alertmanager
{{- define "alertmanager.config.name" -}}
{{- printf "%s-alertmanager-config" .Release.Name }}
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
kubernetes.io/ingress.class: {{ printf "ingress" }}
{{- end }}

{{- define "ingress.rules" -}}
- host: frontend.gokulmylsami.me
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
- host: grafana.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "grafana.service.name" . }}
            port: 
              number: {{ .Values.grafana.service.port}}
- host: prometheus.gokulmylsami.me
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: prometheus-service
            port: 
              number: 9090

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