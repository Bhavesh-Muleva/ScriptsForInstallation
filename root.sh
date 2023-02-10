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
