{{- define "jaeger.query.fullname" -}}
{{- printf "%s-%s" .Chart.Name "query" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "jaeger.query.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jaeger.query.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "jaeger.query.labels" -}}
{{ include "jaeger.query.selectorLabels" . }}
{{ include "jaeger.labels" . }}
{{- end }}
