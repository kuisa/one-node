#!/usr/bin/env sh

ARGO_TOKEN="eyJhIjoiZmQ5YjNkMDdkOWQxZWYxY2M4OGY2ZTJiNDE2OTNmZmUiLCJ0IjoiZWI5ZTU4NDgtMGJlNy00ZmIzLWI4ZjUtYzA2NWQzZDg2MTNmIiwicyI6Ik9EUTFNV1ptWmprdFlqazBPQzAwWmpBMkxUa3daak10WmprNVpHRm1PVGN3T0RNdyJ9"

if [ -z "$ARGO_TOKEN" ]; then
  nohup $PWD/cloudflared tunnel --no-autoupdate --edge-ip-version auto --protocol http2 --url http://localhost:8090 1>$PWD/argo.log 2>&1 &
else
  nohup $PWD/cloudflared tunnel --no-autoupdate --edge-ip-version auto --protocol http2 run --token $ARGO_TOKEN 1>$PWD/argo.log 2>&1 &
fi
