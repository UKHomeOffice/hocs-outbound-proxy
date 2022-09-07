{{- define "healthcheck.envs" }}
startupProbe:
  tcpSocket:
    port: http
  initialDelaySeconds: 5
  periodSeconds: 2
  failureThreshold: 20
livenessProbe:
  tcpSocket:
    port: http
  periodSeconds: 2
readinessProbe:
  tcpSocket:
    port: http
  periodSeconds: 2
{{- end -}}
