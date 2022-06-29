{{- define "jaeger.collector.fullname" -}}
{{- printf "%s-%s" .Chart.Name "collector" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "jaeger.collector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jaeger.collector.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "jaeger.collector.labels" -}}
{{ include "jaeger.collector.selectorLabels" . }}
{{ include "jaeger.labels" . }}
{{- end }}
