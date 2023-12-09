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

