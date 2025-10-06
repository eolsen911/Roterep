##!/bin/bash

# List of source directories
source_dirs=(
  "/opt/certs/k8sfnatt"
  "/opt/certs/other"
  "/opt/certs/polarismedia"
  "/opt/certs/prsubdomain1"
  "/opt/certs/prsubdomain2"
  "/opt/certs/stampen"
)

for src_dir in "${source_dirs[@]}"; do
  if [ -d "$src_dir" ]; then
    # Change ownership of all files and folders in the source directory
    echo "Setting file permissions for $src_dir"
    sudo chmod -R a+w  "$src_dir"

    # Determine corresponding destination under /home/eolsen/
    base_name=$(basename "$src_dir")
    dest_dir="/home/eolsen/$base_name"

    # Create destination directory if it doesn't exist
    mkdir -p "$dest_dir"

    # Backup existing files in the destination (optional)
    timestamp=$(date +%Y%m%d_%H%M%S)
    for file in "$src_dir"/*; do
      fname=$(basename "$file")
      if [ -e "$dest_dir/$fname" ]; then
        mv "$dest_dir/$fname" "$dest_dir/${fname}_backup_$timestamp"
        echo "Backed up $dest_dir/$fname to $dest_dir/${fname}_backup_$timestamp"
      fi
    done

    # Copy all files to destination
    echo "Copying files from $src_dir to $dest_dir"
    cp -a "$src_dir/." "$dest_dir/"

    # Ensure ownership in destination as well
    sudo chown -R eolsen:eolsen "$dest_dir"
  else
    echo "Directory $src_dir does not exist, skipping."
  fi
done

echo "Ownership change and copy process completed."