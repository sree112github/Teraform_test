variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the server"
  type        = string
  default     = "ami-02159ad7e38d562f2"
}

variable "instance_type" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}
