microk8s kubectl drain tullerundt-w3 --ignore-daemonsets --delete-emptydir-data


microk8s kubectl get pods --all-namespaces --field-selector spec.nodeName=tullerundt1-m3 -o yaml |microk8s kubectl delete -f -stdinn