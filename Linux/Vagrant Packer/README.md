# Vagrant and Packer

Setup using WSL2

`https://developer.hashicorp.com/vagrant/docs/other/wsl`

## Packer
Install Packer on windows

```bash
packer init ./packer_init.pkr.hcl
packer build .
```

## Vagrant
Install Vagrant on WSL2

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install vagrant

echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export VAGRANT_DISABLE_VBOXSYMLINKCREATE="1"' >> ~/.bashrc
echo 'export VAGRANT_DISABLE_VBOXSYMLINKCREATE="1"' >> ~/.bashrc
echo 'export PATH="$PATH:/c/Program Files/Oracle/VirtualBox"' >> ~/.bashrc
source ~/.bashrc
```

if vagrant working directory not in user home directory use this
```bash
echo 'export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="path/to/directory"' >> ~/.bashrc 
```

### Usage
Add box
```bash
vagrant box add --provider virtualbox gusztavvargadr/ubuntu-server-2204-lts
ls /.vagrant/boxes
```

Apply Vagrantfile
```bash
vagrant validate
vagrant up
vagrant status
```
SSH
```bash
vagrant ssh [machine name]
```

Remove
```bash
vagrant destory
```





