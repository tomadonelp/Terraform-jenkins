resource "aws_vpc" "vpc_1" {
  cidr_block       = var.vpccidr_block
  instance_tenancy = "default"
provider = aws.pubEnv
  tags = {
    Name = "my first vpc"
  }
}

resource "aws_subnet" "pubsn" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.pubsncider_block
  provider = aws.pubEnv

  tags = {
    Name = "my public subnet"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_1.id
  provider = aws.pubEnv

  tags = {
    Name = "my internet gateway"
  }
}


resource "aws_vpc" "pvtvpc_1" {
  cidr_block       = var.vpccidr_block
  instance_tenancy = "default"
provider = aws.pvtEnv
  tags = {
    Name = "my first vpc"
  }
}

resource "aws_subnet" "pvtsn" {
  vpc_id     = aws_vpc.pvtvpc_1.id
  cidr_block = var.pvtsncider_block
provider = aws.pvtEnv
  tags = {
    Name = "my public subnet"
  }
}