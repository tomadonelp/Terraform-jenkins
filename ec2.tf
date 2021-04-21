resource "aws_instance" "myfirst_instance" {
  provider = aws.pubEnv
  ami           = var.ami
  instance_type = var.aws_instance_type
  security_groups = [aws_security_group.pubsg.id]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo bash -c "echo my firt instance > /var/www/html/index.html
              EOF

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "pubsg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc_1.id
  provider = aws.pubEnv

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc_1.cidr_block]

   
  }
   ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc_1.cidr_block]

   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name ="allow_sg"
    }    
  }


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_1.id
  provider = aws.pubEnv

  route {
    cidr_block = var.pubsncider_block
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "rta" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.pubsn.id
  provider = aws.pubEnv
}
resource "aws_nat_gateway" "ng" {
  subnet_id     = aws_subnet.pubsn.id
  provider = aws.pubEnv
  allocation_id = "value"
}