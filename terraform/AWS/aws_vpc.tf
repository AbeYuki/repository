#----------------------------------------
# VPCの作成
#----------------------------------------
resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.2.0.0/16"
  enable_dns_hostnames = true
  tags          = {
    Name        = "terraform_vpc"
    Environment = "production"
  }
}
#----------------------------------------
# パブリックサブネットの作成
#----------------------------------------
resource "aws_subnet" "terraform_subnet" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags          = {
    Name        = "terraform_subnet"
    Environment = "production"
  }
}
#----------------------------------------
# インターネットゲートウェイの作成
#----------------------------------------
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags          = {
    Name        = "terraform_igw"
    Environment = "production"
  }
}
#----------------------------------------
# ルートテーブルの作成
#----------------------------------------
resource "aws_route_table" "terraform_rtb" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags          = {
    Name        = "terraform_rtb"
    Environment = "production"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
}
#----------------------------------------
# サブネットにルートテーブルを紐づけ
#----------------------------------------
resource "aws_route_table_association" "terraform_rt_assoc" {
  subnet_id      = aws_subnet.terraform_subnet.id
  route_table_id = aws_route_table.terraform_rtb.id
}
#----------------------------------------
# セキュリティグループの作成
#----------------------------------------
resource "aws_security_group" "terraform_sg" {
  name   = "terraform-sg"
  vpc_id = aws_vpc.terraform_vpc.id
  tags          = {
    Name        = "terraform_sg"
    Environment = "production"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
