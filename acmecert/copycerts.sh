#!/bin/bash

declare -A paths=(
  ["/home/eolsen/acmecerts/k8sfnatt/"]="/home/erik/acmecerts/k8sfnatt/"
  ["/home/eolsen/acmecerts/other/"]="/home/erik/acmecerts/other/"
  ["/home/eolsen/acmecerts/polarismedia/"]="/home/erik/acmecerts/polarismedia/"
  ["/home/eolsen/acmecerts/prsubdomain1/"]="/home/erik/acmecerts/prsubdomain1/"
  ["/home/eolsen/acmecerts/prsubdomain2/"]="/home/erik/acmecerts/prsubdomain2/"
  ["/home/eolsen/acmecerts/stampen/"]="/home/erik/acmecerts/stampen/"
)

remote="eolsen@it-devops-1.adresseavisen.no"

for src in "${!paths[@]}"; do
  dest="${paths[$src]}"
  timestamp=$(date +%Y%m%d_%H%M%S)

  # Make sure destination exists
  mkdir -p "$dest"

  # Rename all existing files in destination by appending a timestamp
  for file in "$dest"*; do
    if [ -f "$file" ]; then
      base=$(basename "$file")
      mv "$file" "$dest/${base}_backup_$timestamp"
      echo "Renamed $file to $dest/${base}_backup_$timestamp"
    fi
  done

  # Copy all files from remote source directory to local destination directory
  scp -r "$remote:$src"* "$dest"
done