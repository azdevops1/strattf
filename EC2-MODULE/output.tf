

  output "public_ip" {
     value = {for i in aws_instance.shi_GitLabInstance : i.tags.Name => i.public_ip}
     sensitive = false 
 }
