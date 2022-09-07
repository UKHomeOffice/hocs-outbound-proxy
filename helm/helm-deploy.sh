#!/usr/bin/env bash

helm upgrade hocs-outbound-proxy \
 ./helm/hocs-outbound-proxy \
--atomic \
--cleanup-on-fail \
--install \
--reset-values \
--timeout 3m \
--history-max 3 \
--namespace ${KUBE_NAMESPACE} \
--set version=${VERSION} ${VALUES_FILE}
