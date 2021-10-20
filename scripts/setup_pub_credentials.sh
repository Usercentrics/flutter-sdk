#!/bin/sh -xe

$CREDENTIAL=$1

check_credentials() {
  echo "Check credentials"
  if [ -z "$CREDENTIAL" ]; then
    echo "Missing credential"
    exit 1
  fi
  echo "OK"
}

copy_credentials() {
  echo "Copy credentials"
  mkdir -p ~/.pub-cache
  cat <<EOF > ~/.pub-cache/credentials.json
$CREDENTIAL
EOF
  echo "OK"
}

check_credentials
copy_credentials