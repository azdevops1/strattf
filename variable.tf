variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_id" {
  default = "vpc-0fd3301fb02c2bc85"
}

variable "subnet_id" {
  default = "subnet-057792bfc51237a9d"
}

variable "access_key" {
  description = "Value of the Access key for AWS"
  type        = string
}

variable "secret_key" {
  description = "Value of the Secret Key for AWS"
  type        = string
}