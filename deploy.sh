#!/usr/bin/env ash

kubectl config view

curl https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-notprod.crt \
--output /tmp/cluster_ca.crt

kubectl config set-cluster "${KUBE_NAMESPACE}" \
--certificate-authority="/tmp/cluster_ca.crt" \
--server="${KUBE_SERVER}"

helm upgrade hocs-outbound-proxy \
--atomic \
--cleanup-on-fail \
--install \
--reset-values \
--timeout 5m \
--history-max int 3 \
--set version=${VERSION} \
--values=values-notprod.yaml
