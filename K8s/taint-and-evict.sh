#!/bin/bash

# Node to exclude
NODE_TO_TAINT="tullerundt1-w3"
TAINT_KEY="maintenance"
TAINT_EFFECT="NoSchedule"

echo "📛 Tainting node: $NODE_TO_TAINT"
microk8s kubectl taint nodes "$NODE_TO_TAINT" $TAINT_KEY=true:$TAINT_EFFECT

echo "🧊 Cordoning node: $NODE_TO_TAINT"
microk8s kubectl cordon "$NODE_TO_TAINT"

echo "🔍 Finding pods on $NODE_TO_TAINT (excluding system pods)"
microk8s kubectl get pods --all-namespaces -o wide | grep "$NODE_TO_TAINT" | grep -v "kube-system" | while read -r line; do
    NS=$(echo $line | awk '{print $1}')
    POD=$(echo $line | awk '{print $2}')
    echo "❌ Deleting pod $NS/$POD"
    microk8s kubectl delete pod "$POD" -n "$NS"
done

echo "✅ Done. Pods will reschedule to other nodes."
