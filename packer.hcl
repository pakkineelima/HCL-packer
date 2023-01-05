packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "secondimage" {
  access_key    = "***********"
  secret_key    = "****************"
  ami_name      = "my_image"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami   =  "ami-0b5eea76982371e91"
  ssh_username = "ec2-user"
}

build {

  sources = [
    "source.amazon-ebs.my_image"
  ]
  provisioner "ansible"{
    playbook_file = "./ansible-playbook.yml"},
   {
}
}
