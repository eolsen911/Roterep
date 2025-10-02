#!/bin/bash

# Define source and destination pairs
declare -A paths=(
  ["/opt/certs/k8sfnatt/cert.p12"]="/home/erik/acmecerts/k8sfnatt/"
  ["/opt/certs/other/cert.p12"]="/home/erik/acmecerts/other/"
  ["/opt/certs/polarismedia/cert.p12"]="/home/erik/acmecerts/polarismedia/"
  ["/opt/certs/prsubdomain1/cert.p12"]="/home/erik/acmecerts/prsubdomain1/"
  ["/opt/certs/prsubdomain2/cert.p12"]="/home/erik/acmecerts/prsubdomain2/"
  ["/opt/certs/stampen/cert.p12"]="/home/erik/acmecerts/stampen/"
)

remote="eolsen@it-devops-1.adresseavisen.no"

for src in "${!paths[@]}"; do
  dest="${paths[$src]}"
  file="$dest/cert.p12"

  # If cert.p12 already exists, rename it with a timestamp
  if [ -f "$file" ]; then
    mv "$file" "$dest/cert_$(date +%Y%m%d_%H%M%S).p12"
    echo "Renamed existing cert in $dest"
  fi

  # Copy the new file
  scp "$remote:$src" "$dest"
done