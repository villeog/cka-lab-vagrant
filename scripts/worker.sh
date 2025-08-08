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
apt update && apt install -y kubelet kubeadm
apt-mark hold kubelet kubeadm

