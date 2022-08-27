# hocs-outbound-proxy

Set up as a transparent proxy using Squid, to be used in conjunction with kubernetes network policies, traffic is limited to whitelisted domains:

* .notifications.service.gov.uk
* .homeoffice.gov.uk
* .amazonaws.com
* .parliament.uk
* .parliament.scot
* .niassembly.gov.uk
* .assembly.wales

## Example configuration for java service
 
```yaml
env:
  - name: JAVA_OPTS
    value: '-Dhttps.proxyHost=hocs-outbound-proxy.{{.KUBE_NAMESPACE}}.svc.cluster.local -Dhttps.proxyPort=31290 -Dhttp.nonProxyHosts=*.{{.KUBE_NAMESPACE}}.svc.cluster.local'

```
