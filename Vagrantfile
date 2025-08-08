VAGRANTFILE_API_VERSION = "2"

NUM_WORKERS = 2
MASTER_IP = "192.168.56.10"
BASE_IP = "192.168.56."

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: MASTER_IP
    master.vm.provision "shell", path: "scripts/master.sh"
  end

  (1..NUM_WORKERS).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "worker#{i}"
      worker.vm.network "private_network", ip: "#{BASE_IP}#{10 + i}"
      worker.vm.provision "shell", path: "scripts/worker.sh"
    end
  end
end

