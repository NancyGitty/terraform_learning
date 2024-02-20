resource "aws_instance" "ec2_instance" {
  count                  = 5
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "olowo-terra"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = count.index == 4 ? "controller" : "${var.instance_labels[count.index]}"
  }
  user_data = <<-EOF
              #!/bin/bash
              echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu
              sudo apt update -y
              sudo apt upgrade -y
              hostnamectl set-hostname ${count.index == 4 ? "controller" : var.instance_labels[count.index]}
              EOF
}
