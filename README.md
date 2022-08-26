# Kube HOCS
This repository contains kubernetes configuration for the Home Office Correspondence System

## Network Policies
Configured to apply to pods with the associated role.

![Network Policy Diagram](/diagrams/network-policies.png "Network Policy Diagram")

### hocs-frontend-policy
```
Selector: 
    role: hocs-frontend
Ingress:
    external-ingress :10443
Egress:
    namespace
```
### hocs-backend-policy
```
Selector:
    role: hocs-backend
Ingress:
    hocs-frontend    :10443
Egress:
    namespace
    RDS              :5432
```
### hocs-proxy-policy
```
Selector: 
    name: hocs-outbound-proxy
Ingress:
    hocs-frontend    :31290
    hocs-backend     :31290
Egress:
    www
```
## Outbound Proxy
Set up as a transparent proxy using Squid, traffic is limited to whitelisted domains over https.

__Whitelist__
```
GOV.UK Notify Service
Keycloak Dev realm
```

