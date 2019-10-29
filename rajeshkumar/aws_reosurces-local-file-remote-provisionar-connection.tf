resource "aws_instance" "web" {
  ami           = "ami-5b673c34"
  instance_type = "t2.micro"
  key_name = "rajesh-allianz"
 

  tags = {
    Name = "RajeshKumar"
  }

 provisioner "local-exec" {
    command = "echo 'Welcome to Terraform Allianz Classx' >> /Users/rajeshkumar/terraform/local-exec.txt"
  }

 provisioner "local-exec" {
    command = "/bin/bash deploy.sh"
  }

 provisioner "local-exec" {
    command = "open WFH, '>completed.txt' and print WFH scalar localtime"
    interpreter = ["perl", "-e"]
  }

 provisioner "file" {
  source      = "index.html"
  destination = "/tmp/index.html"

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

  connection {
    type     = "ssh"
    user     = "ec2-user"
    #private_key = "id_rsa"
    private_key = file("/Users/rajeshkumar/.ssh/id_rsa")
    #host = "self"
    #host = "self.public_ip"
     host = "${self.public_ip}"
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = "rajesh-allianz"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9Cb4SIaQmq+0CGRGiOD8z5ILYQ93wFZJIROhGv8ZQYmUzOk4zjbcEgq+gqZbKDe0VmY8LbBtRG3U+NXaRVDbsk2pQCvUworXiR6tGj3Cx450w0o6R1vsvDfmqV1ggVBmRh+4FxWnrSSonF7tXCKCIBa5keCNGqxP2/CSbfFlzMY31DPCgscbPT7aR20KA3Wi50Nfonib2djagI56bW9juiXODXROnleABXq5iHgaSRkU6VpdihRSJXOPPUHB2aHlfgZ3A+YvqJPcENH4CIsugX1HyXuB1OAIm1df0FkPZ4G4n0zUryZySFCGnemGD1FSpo2W54F/snYNcfoQFJ0sb rajeshkumar@Rajeshs-MacBook-Pro.local"
}
