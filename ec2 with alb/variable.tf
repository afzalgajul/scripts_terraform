variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-0b029b1931b347543"

}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "aws-region" {
  default = "us-west-2"
}


variable "tag-key" {
  type    = string
  default = "new-key"
}

variable "vpc_id" {
  default = "vpc-030bb046fadb71970"
}

variable "security_groups" {
  type    = string
  default = "sg-02d4d2ed96dbef4b9"
}

variable "subnet1" {
  default = "subnet-0d703f887c0340385"
}
variable "subnet2" {
  default = "subnet-03846a56f7c1381a6"
}
