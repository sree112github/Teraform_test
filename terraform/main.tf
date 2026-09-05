provider "aws"{
  
   region = var.aws_region

}

resource "aws_instance" "terra-created-instance"{

   ami = var.ami_id
   instance_type = var.instance_type
   tags ={
      "tag-tera" = "terra-created-instance"
   }

}