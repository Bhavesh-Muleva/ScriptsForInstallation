chmod u+x *
./kubectl.sh
echo "---"
./kind.sh
echo "---"
./clusterctl.sh
echo "---"
./clusterawsadm.sh
clear
echo "---"
echo "Kubectl, Kind, Clusterctl, Clusterawsadm Installed"
echo "---"
kind create cluster
echo "Cluster is Created..."

echo "Time to create management cluster"
# Enable the experimental Cluster topology feature.
export CLUSTER_TOPOLOGY=true

# Initialize the management cluster
clusterctl init --infrastructure docker

echo "generating capi-quickstart.yaml file"
clusterctl generate cluster capi-quickstart --flavor development \
  --kubernetes-version v1.26.0 \
  --control-plane-machine-count=1 \
  --worker-machine-count=2 \
  > capi-quickstart.yaml
