
  
locals {
  security_groups = {
    public = {
      name        = "shi_sg"
      description = "Allow  ssh inbound traffic"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        jenkins = {
          from        = 8080
          to          = 8080
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

      }
    }
 }
}

