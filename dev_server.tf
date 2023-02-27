variable "default_instance_type" {
  type    = string
  default = "t2.nano"
}
variable "default_web_subnet"{
  type = string
  default = "aws_subnet.redhat9_102.id"
}
data "template_file" "user_data" {
  template = file("./scripts/default_server.yaml")
}


resource "aws_instance" "lab-rh9-0001" {
  ami                            = "ami-068638f6d6b1f"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_102.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "redhat9-0001"
    "Terraform" = "true"
  }
}

resource "aws_instance" "lab-rh9-0002" {
  ami                            = "ami-068638f6d6b1f"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_102.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "redhat9-0001"
    "Terraform" = "true"
  }
}
