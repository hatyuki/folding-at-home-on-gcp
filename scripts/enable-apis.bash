#!/bin/bash -eu

## Enable APIs
services=(
  compute
)

for service in "${services[@]}"; do
  api="${service}.googleapis.com"

  if [[ -z $(gcloud services list --filter="NAME=${api}" 2>/dev/null) ]];then
    gcloud services enable "${api}"
  fi
done
