#VPC
variable "VPC_CIDR_BLOCK" {
  default = "0.0.0.0/0"
}
variable "VPC_Name" {
  default = "VPC"
}

#Subnet 1
variable "Subnet1_CIDR_block" {
  default = "0.0.0.0/0"
}
variable "Subnet1_Name" {
  default = "Subnet"
}
variable "Subnet1_AZ" {
  default = "us-east-1a"
}

#Subnet 2
variable "Subnet2_CIDR_block" {
  default = "0.0.0.0/0"
}
variable "Subnet2_Name" {
  default = "Subnet"
}
variable "Subnet2_AZ" {
  default = "us-east-1a"
}

#Security Group 1
variable "SG1_Name" {
  default = "Security Group"
}
variable "SG1_Desc" {
  default = "A Security Group"
}

#Security Group 2
variable "SG2_Name" {
  default = "Security Group"
}
variable "SG2_Desc" {
  default = "A Security Group"
}

#Instance 1
variable "instance1_ami" {
  default = "default"
}
variable "instance1_type" {
  default = "t2.micro"
}
variable "instance1_key" {
  default = "mykey"
}

#Instance 2
variable "instance2_ami" {
  default = "default"
}
variable "instance2_type" {
  default = "t2.micro"
}
variable "instance2_key" {
  default = "mykey"
}
