resource "aws_instance" "web1" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = "${var.my_subnet}"
  associate_public_ip_address = true
  key_name = "gsb-AZ"

  tags = merge(var.common_tags,
    map("Type", "Web"),
  map("Name", "${upper(var.account_name)}"))


   connection {

    type     = "ssh"
    user     = "ec2-user"
    private_key = file("sshpri.ppk")
    host = "${self.public_ip}"

     }
    
      provisioner "remote-exec" {

    inline = [
      "sudo yum install wget -y",
      "wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
      "sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y",
      "sudo rpm -i epel-release-latest-7.noarch.rpm",
      "sudo yum install ansible -y",
      "sudo yum install git -y",
      "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
      "ansible-playbook /tmp/ans_ws/site.yaml",
    ]

  }
}

  resource "aws_key_pair" "deployer" {
  key_name   = "gsb-AZ"
  public_key = file("sshpub")

  }

