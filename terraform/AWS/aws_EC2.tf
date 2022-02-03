#----------------------------------------
# EC2インスタンスの作成
#----------------------------------------
resource "aws_instance" "terraform_web_server" {
  ami                    = "ami-09d28faae2e9e7138" # Amazon Linux 2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.terraform_subnet.id
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  user_data = <<EOF
#! /bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
EOF
}