#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export KUBE_SERVER=${KUBE_SERVER}

if [[ -z ${VERSION} ]] ; then
    export VERSION=${IMAGE_VERSION}
fi

if [[ ${ENVIRONMENT} == "prod" ]] ; then
    echo "deploy ${VERSION} to PROD namespace, using CS_PROD drone secret"
    export KUBE_TOKEN=${CS_PROD}
    export KC_URL=sso.digital.homeoffice.gov.uk
    export RDS_CIDR=10.250.48.0/21
else
    if [[ ${ENVIRONMENT} == "qa" ]] ; then
        echo "deploy ${VERSION} to QA namespace, using CS_QA drone secret"
        export KUBE_TOKEN=${CS_QA}
    else
        echo "deploy ${VERSION} to DEV namespace, using CS_DEV drone secret"
        export KUBE_TOKEN=${CS_DEV}
    fi
    export KC_URL=sso-dev.notprod.homeoffice.gov.uk
    export RDS_CIDR=10.250.24.0/21
fi

if [[ -z ${KUBE_TOKEN} ]] ; then
    echo "Failed to find a value for KUBE_TOKEN - exiting"
    exit -1
fi

echo
echo "Deploying Network Policies and Outbound Proxy to ${ENVIRONMENT} @ version: ${VERSION}"
echo

cd kd

kd --insecure-skip-tls-verify \
    -f ./kube/hocs-backend-networkpolicy.yaml \
    -f ./kube/hocs-frontend-networkpolicy.yaml \
    -f ./kube/hocs-outbound-proxy-networkpolicy.yaml \
    -f ./kube/hocs-outbound-proxy-configmap.yaml \
    -f ./kube/hocs-outbound-proxy-service.yaml \
    -f ./kube/hocs-outbound-proxy-deployment.yaml
