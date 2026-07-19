#!/bin/bash

growpart /dev/nvme0n1 4

lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -L +10G /dev/mapper/RootVG-rootVol
lvextend -l +100%FREE /dev/mapper/RootVG-homeVol

xfs_growfs /
xfs_growfs /var
xfs_growfs /home


yum install java-21-openjdk -y

#installing terraform 
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

#installing docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker 
systemctl enable docker 
usermod -aG docker ec2-user

#installing kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.3/2026-04-08/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH


dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cd /home/ec2-user
su - ec2-user -c '
#   echo "..."
#   echo "..."
#   echo "installing ebs drivers"
#   kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.61"

#   echo "..."
#   echo "..."
#   echo "installing kubectx"
#   git clone https://github.com/ahmetb/kubectx.git
#   cd kubectx
#   chmod +x kubens
#   sudo mv ./kubens /usr/local/bin
#   cd ..

#   echo "..."
#   echo "..."
#   echo "installing helm"
#   curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
#   chmod 700 get_helm.sh
#   ./get_helm.sh

#   echo "..."
#   echo "..."
#   echo "installing k9s"
#   curl -sS https://webinstall.dev/k9s | bash
'