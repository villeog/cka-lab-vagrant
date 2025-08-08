#!/bin/bash
set -e

swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

apt update && apt install -y containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml
systemctl restart containerd

apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

