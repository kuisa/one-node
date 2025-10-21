#!/usr/bin/env sh

ARGO_TOKEN="${ARGO_TOKEN:-eyJhIjoiZmQ5YjNkMDdkOWQxZWYxY2M4OGY2ZTJiNDE2OTNmZmUiLCJ0IjoiZWI5ZTU4NDgtMGJlNy00ZmIzLWI4ZjUtYzA2NWQzZDg2MTNmIiwicyI6Ik9EUTFNV1ptWmprdFlqazBPQzAwWmpBMkxUa3daak10WmprNVpHRm1PVGN3T0RNdyJ9}"

# 1. init directory
mkdir -p app/argo
cd app/argo

# 2. download cloudflared
if [ ! -f cloudflared ]; then
  wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/download/2025.9.0/cloudflared-linux-amd64
  chmod +x cloudflared
fi

# 3. create startup.sh
wget -O startup.sh https://raw.githubusercontent.com/vevc/one-node/refs/heads/main/google-idx/argo/startup.sh
sed -i 's#$PWD#'$PWD'#g' startup.sh
if [ -n "$ARGO_TOKEN" ]; then
  sed -i "s/ARGO_TOKEN=/ARGO_TOKEN=$ARGO_TOKEN/g" startup.sh
fi
chmod +x startup.sh

# 4. return main directory
cd -
