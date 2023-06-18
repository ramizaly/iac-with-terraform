# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
  access_key = "<Access Key>"
  secret_key = "<Secret Acess Key>"
}

resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR_BLOCK
  tags = {
    Name = var.VPC_Name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
# Create the subnet 1
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Subnet1_CIDR_block
  availability_zone       = var.Subnet1_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = var.Subnet1_Name
  }
}

# Create the subnet 2
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Subnet2_CIDR_block
  availability_zone       = var.Subnet2_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = var.Subnet2_Name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "association" {
  subnet_id = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.route-table.id
}

# Create the security group 1
resource "aws_security_group" "security_group_1" {
  name        = var.SG1_Name
  description = var.SG1_Desc
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 22
    to_port     = 22
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

# Create the security group 2
resource "aws_security_group" "security_group_2" {
  name        = var.SG2_Name
  description = var.SG2_Desc
   vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
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

# Create the first EC2 instance
resource "aws_instance" "instance_1" {
  ami           = var.instance1_ami
  instance_type = var.instance1_type
  subnet_id     = aws_subnet.subnet_1.id
  key_name      = var.instance1_key
  vpc_security_group_ids = [aws_security_group.security_group_1.id]

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
}

# Create the second EC2 instance
resource "aws_instance" "instance_2" {
  ami           = var.instance2_ami
  instance_type = var.instance2_type
  subnet_id     = aws_subnet.subnet_2.id
  key_name      = var.instance2_key
  vpc_security_group_ids = [aws_security_group.security_group_2.id]

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
}