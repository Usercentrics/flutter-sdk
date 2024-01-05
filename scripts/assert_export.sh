#!/bin/bash -xe

function check() {
  DIR_PATH="$1"
  FILE_NAME="$2"

  if [ ! -f "$DIR_PATH/$FILE_NAME" ]; then
      echo "$FILE_NAME not found in the specified directory"
      exit 1
  fi

  for file in "$DIR_PATH"/*.dart; do
      filename=$(basename "$file")

      if [ "$filename" == "$FILE_NAME" ]; then
          continue
      fi

      if ! grep -q "export '$filename'" "$DIR_PATH/$FILE_NAME"; then
          echo "Missing export for $filename"
          exit 1;
      fi
  done
}

check 'lib/src/model' 'model.dart'
check 'lib/src/internal/bridge' 'bridge.dart'
check 'lib/src/internal/serializer' 'serializer.dart'

echo "All exported"
