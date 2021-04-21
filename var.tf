variable "vpccidr_block" {
    type = string
    description = "vpc cidr blocks"
    default = "10.0.0.0/16"
  
}
variable "ami" {
    type = string
    description = "my ami"
    default =  "ami-0577b787189839998"
  
}
variable "aws_instance_type" {
    type = string
    description = "instance type"
    default = "t2.micro"
  
}
variable "pubsncider_block" {
    type = string
    description = "subnet cidr block"
    default = "10.0.1.0/24"
  
}

variable "pvtsncider_block" {
    type = string
    default = "10.0.1.0/24"
}

variable "pubEnv" {
    type = string
    default =  "us-west-1"
}

variable "pvtEnv" {
    type = string
    default =  "us-west-2"
}