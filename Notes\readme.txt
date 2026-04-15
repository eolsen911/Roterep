Oneliners, and other notes


Calico sandbox image fix 

Fastest workaround right now

Load the image manually from a machine that has working internet.

On another machine:

docker pull registry.k8s.io/pause:3.10
docker save registry.k8s.io/pause:3.10 -o pause-3.10.tar

Copy pause-3.10.tar to the VM, then:

microk8s ctr images import pause-3.10.tar
microk8s ctr images ls | grep 'pause.*3.10'
sudo snap restart microk8s
microk8s kubectl get pods -n kube-system -w

Once calico-node gets past sandbox creation, the node should move toward Ready.

