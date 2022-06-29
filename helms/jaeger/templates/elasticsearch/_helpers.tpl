{{- define "jaeger.elasticsearch.fullname" -}}
{{- printf "%s-%s" .Chart.Name "elasticsearch" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "jaeger.elasticsearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jaeger.elasticsearch.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "jaeger.elasticsearch.labels" -}}
{{ include "jaeger.elasticsearch.selectorLabels" . }}
{{ include "jaeger.labels" . }}
{{- end }}

{{- define "jaeger.elasticsearch.endpoints" -}}
{{- $replicas := int (toString (.Values.elasticsearch.replicaCount)) }}
{{- $name := (include "jaeger.elasticsearch.fullname" .) }}
  {{- range $i, $e := untilStep 0 $replicas 1 -}}
{{ $name }}-{{ $i }}{{ if ne $replicas (add $i 1) }},{{ end }}
  {{- end -}}
{{- end -}}


{{- define "jaeger.elasticsearch.address" -}}
http://{{ include "jaeger.elasticsearch.fullname" . }}:9200
{{- end -}}
