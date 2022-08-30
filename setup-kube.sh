#!/usr/bin/env ash
echo $HOME

curl https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/${KUBE_CLUSTER}.crt \
  --output /tmp/cluster_ca.crt

kubectl config set-cluster "${KUBE_CLUSTER}" \
  --certificate-authority="/tmp/cluster_ca.crt" \
  --server="${KUBE_SERVER}"

kubectl config set-credentials helm \
  --token="${KUBE_TOKEN}"

kubectl config set-context helm \
  --cluster="${KUBE_CLUSTER}" \
  --user="helm" \
  --namespace="${KUBE_NAMESPACE}"

kubectl config use-context helm
