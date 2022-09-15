{{- define "volumeMounts.envs" }}
- name: hocs-outbound-proxy-config
  mountPath: /etc/squid
{{- end -}}
