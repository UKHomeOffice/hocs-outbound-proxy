{{/*
Expand the name of the chart.
*/}}
{{- define "hocs-outbound-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hocs-outbound-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Values.version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hocs-outbound-proxy.selectorLabels" -}}
name: {{ include "hocs-outbound-proxy.name" . }}
role: {{ include "hocs-outbound-proxy.name" . }}
version: {{.Values.version}}
{{- end }}
