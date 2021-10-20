#!/bin/sh -xe

check_credentials() {
  echo "Check credentials"
  if [ -z "$PUB_DEV_CREDENTIAL" ]; then
    echo "Missing credential"
    exit 1
  fi
  echo "OK"
}

copy_credentials() {
  echo "Copy credentials"
  mkdir -p ~/.pub-cache
  cat <<EOF > ~/.pub-cache/credentials.json
$PUB_DEV_CREDENTIAL
EOF
  echo "OK"
}

check_credentials
copy_credentials