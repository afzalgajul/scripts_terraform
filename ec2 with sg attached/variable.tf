variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-0f1a5f5ada0e7da53"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "aws-region" {
  default = "us-west-2a"
}
