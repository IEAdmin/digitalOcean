dropletName   = "testDroplet"
dropletImage  = "ubuntu-20-04-x64"
dropletRegion = "nyc3"
dropletSize   = "s-1vcpu-1gb"
dropletInlineProvisioner = [
  "export PATH=$PATH:/usr/bin",
  "sudo apt update",
  "sudo apt install -y nginx"
]
sshKeyName              = "testKey"
sshKeyPath              = "../.ssh/id_rsa.pub"
htmlSourceLocation      = "../index.html"
htmlDestinationLocation = "/usr/share/nginx/html"
privateKeyPath          = "../ssh/id_rsa"
dropletUserName         = "testUser"
