{{- define "jaeger.cleaner.fullname" -}}
{{- printf "%s-%s" .Chart.Name "cleaner" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "jaeger.cleaner.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jaeger.cleaner.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "jaeger.cleaner.labels" -}}
{{ include "jaeger.cleaner.selectorLabels" . }}
{{ include "jaeger.labels" . }}
{{- end }}
