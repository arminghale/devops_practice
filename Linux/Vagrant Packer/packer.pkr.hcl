source "virtualbox-iso" "ubuntu-docker-nginx" {
  guest_os_type    = "Ubuntu_64"
  iso_url          = "https://releases.ubuntu.com/22.04/ubuntu-22.04.5-live-server-amd64.iso"
  iso_checksum     = "file:https://releases.ubuntu.com/22.04/SHA256SUMS"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_timeout      = "20m"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  vboxmanage       = [["modifyvm", "{{.Name}}", "--memory", "1024"],["modifyvm", "{{.Name}}", "--cpus", "2"]]
}

build {
  sources = ["sources.virtualbox-iso.ubuntu-docker-nginx"]
  provisioner "shell" {
    inline = [
      "echo \"packer\" | sudo -S apt-get install -y ca-certificates curl gnupg lsb-release",
      "echo \"packer\" | sudo -S mkdir -p /etc/apt/keyrings",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
      "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "echo \"packer\" | sudo -S apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin",
      "echo \"packer\" | sudo -S apt install -y nginx",
      "echo \"packer\" | sudo -S ufw allow Nginx Full"
    ]
  }

}
