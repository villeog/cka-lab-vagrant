![Vagrant](https://img.shields.io/badge/Vagrant-2.3.4-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-1.29-blue)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange)
![CKA Prep](https://img.shields.io/badge/CKA-Home%20Lab-green)


# 🧪 CKA Home Lab with Vagrant & kubeadm

This project sets up a multi-node Kubernetes cluster locally using Vagrant and VirtualBox — ideal for Certified Kubernetes Administrator (CKA) exam prep.

## 🚀 Features

- 1 control plane + 2 worker nodes
- Ubuntu 22.04 LTS base image
- containerd as container runtime
- kubeadm for cluster bootstrapping
- Flannel CNI for networking

## 🛠️ Requirements

- VirtualBox
- Vagrant

## 📦 Setup Instructions

```bash
git clone https://github.com/<your-username>/cka-lab-vagrant.git
cd cka-lab-vagrant
vagrant up

