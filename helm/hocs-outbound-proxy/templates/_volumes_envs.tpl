{{- define "volumes.envs" }}
- name: hocs-outbound-proxy-config
  configMap:
    name: hocs-outbound-proxy-config
{{- end -}}
