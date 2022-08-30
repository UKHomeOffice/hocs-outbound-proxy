#!/usr/bin/env ash

helm upgrade hocs-outbound-proxy \
 ./helm/hocs-outbound-proxy \
--atomic \
--cleanup-on-fail \
--install \
--reset-values \
--timeout 5m \
--history-max 3 \
--values=./helm/values-notprod.yaml \
--set version=${VERSION} \
