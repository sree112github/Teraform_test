provider "aws"{
   region = var.aws_region
}

# Add a security group to allow SSH and HTTP traffic
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP for Go app"
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "terra-created-instance"{
   ami           = var.ami_id
   instance_type = var.instance_type
   key_name      = "first-ec2" # Update this to the exact name of your AWS key pair
   
   # Attach the security group to the instance
   vpc_security_group_ids = [aws_security_group.web_sg.id]

   tags ={
      "tag-tera" = "terra-created-instance"
   }
}