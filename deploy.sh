#!/usr/bin/env ash
echo $HOME

helm upgrade hocs-outbound-proxy \
 ./helm/hocs-outbound-proxy \
--atomic \
--cleanup-on-fail \
--install \
--reset-values \
--timeout 3m \
--history-max 3 \
--values=./helm/values-notprod.yaml \
--set version=${VERSION} \
