# VPC
VPC_CIDR_BLOCK = "10.0.0./16"
VPC_Name = "New_VPC"

#Subnet 1
Subnet1_CIDR_block = "10.0.1.0/24"
Subnet1_AZ = "us-east-1a"
Subnet1_Name = "Subnet-1"

#Subnet 2
Subnet2_CIDR_block = "10.0.2.0/24"
Subnet2_AZ = "us-east-1b"
Subnet2_Name = "Subnet-2"


#Security Group 1
SG1_Name = "Security Group 1"
SG1_Desc = "Security group for the first instance"

#Security Group 2
SG2_Name = "Security Group 2"
SG2_Desc = "Security group for the second instance"

#Instance 1
instance1_ami = "ami-022e1a32d3f742bd8"
instance1_type = "t3.micro"
instance1_key = "NewKey"

#Instance 2
instance2_ami = "ami-022e1a32d3f742bd8"
instance2_type = "t2.micro"
instance2_key = "NewKey"