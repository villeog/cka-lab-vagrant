# Makefile for CKA Vagrant Lab

up:
    vagrant up

destroy:
    vagrant destroy -f

ssh-master:
    vagrant ssh master

ssh-worker1:
    vagrant ssh worker1

ssh-worker2:
    vagrant ssh worker2

join-command:
    vagrant ssh master -c "kubeadm token create --print-join-command"

status:
    vagrant status

