
locals {
    shi_web_sg = [aws_security_group.shi_GitLabInstance_SG["public"].id]
}

output "public_ip" {
  value = module.EC2-GitLap.public_ip
}


 data "aws_key_pair" "aicb" {
  key_name = "aicb"
  filter {
    name   = "tag:Name"
    values = ["aicb"]
  }
}

resource "aws_security_group" "shi_GitLabInstance_SG" {
   for_each    = local.security_groups
   name        = each.value.name
   description = each.value.description
   vpc_id      = var.vpc_id

   dynamic "ingress" {
    for_each = each.value.ingress
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow ssh and http"
  }
}

module "EC2-GitLap" {
  source = "./EC2-MODULE"
  instance_count = 1
  instance_type =  var.instance_type
  public_sg = local.shi_web_sg

 keypair_name = data.aws_key_pair.aicb.key_name
  user_data_path =  "${path.root}/userdata.tpl"
  vol_size = 40
  subnet_id = var.subnet_id
  TagNmae = "shi_GitLabInstance"
 
}

