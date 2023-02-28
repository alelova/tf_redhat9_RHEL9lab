variable "default_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "default_web_subnet"{
  type = string
  default = "aws_subnet.redhat9_102.id"
}
data "template_file" "user_data" {
  template = file("./scripts/default_server.yaml")
}


resource "aws_instance" "lab-rh9-001" {
  ami                            = "ami-03f255060aa887525"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_102.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "lab-rh9-001"
    "Terraform" = "true"
  }
}

resource "aws_instance" "lab-rh9-002" {
  ami                            = "ami-03f255060aa887525"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_102.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "lab-rh9-002"
    "Terraform" = "true"
  }
}
resource "aws_ebs_volume" "data-lab-rh9-001" {
# availability_zone = "ap-south-1a"
 size = 1
 tags = {
        Name = "data-lab-rh9-001"
 }
}
#
resource "aws_volume_attachment" "va_data-lab-rh9-001" {
 device_name = "/dev/sdc"
 volume_id = "${aws_ebs_volume.data-lab-rh9-001}"
 instance_id = "${aws_instance.lab-rh9-001}"
}
resource "aws_ebs_volume" "data-lab-rh9-002" {
# availability_zone = "ap-south-1a"
 size = 1
 tags = {
        Name = "data-lab-rh9-002"
 }
}
#
resource "aws_volume_attachment" "va_data-lab-rh9-002" {
 device_name = "/dev/sdc"
 volume_id = "${aws_ebs_volume.data-lab-rh9-002}"
 instance_id = "${aws_instance.lab-rh9-002}"
}
