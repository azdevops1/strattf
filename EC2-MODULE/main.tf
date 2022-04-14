
data "aws_ami" "amazon_linux" {
    most_recent = true
    filter {
        name  = "name"
        values = ["amzn2-ami-hvm*-x86_64-gp2"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
  owners = ["amazon"]
}

 resource "aws_instance" "shi_GitLabInstance" {
  count = var.instance_count 
  instance_type = var.instance_type 
   ami           = data.aws_ami.amazon_linux.id

  key_name = var.keypair_name
  vpc_security_group_ids = var.public_sg
  subnet_id = var.subnet_id
  user_data = templatefile(var.user_data_path,
  {
   vars = []
  }
  )
  root_block_device {
   volume_size = var.vol_size 
  }

    tags = {
     Name = var.TagNmae
   }
   lifecycle {
     ignore_changes = [
       user_data,
     ]
   }
   }

   
