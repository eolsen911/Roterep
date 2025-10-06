#!/bin/bash

# List of source directories
source_dirs=(
  "/opt/certs/k8sfnatt"
  "/opt/certs/other"
  "/opt/certs/polarismedia"
  "/opt/certs/prsubdomain1"
  "/opt/certs/prsubdomain2"
  "/opt/certs/stampen"
)

for dir in "${source_dirs[@]}"; do
  if [ -d "$dir" ]; then
    echo "Changing owner to eolsen for all files in $dir"
    sudo chown -R eolsen:eolsen "$dir"
  else
    echo "Directory $dir does not exist, skipping."
  fi
done

echo "Ownership change process completed."