for ns in $(microk8s kubectl get pdb --all-namespaces -o jsonpath='{.items[*].metadata.namespace}' | tr ' ' '\n' | sort -u); do
  for pdb in $(microk8s kubectl get pdb -n "$ns" -o jsonpath='{.items[*].metadata.name}'); do
    echo "Patching $ns/$pdb"
    microk8s kubectl patch pdb "$pdb" -n "$ns" --type=merge -p '{"spec":{"minAvailable":0}}'
  done
done