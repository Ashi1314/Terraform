#key pair(login)
resource "aws_key_pair" "my-new-key" {
  key_name= "${var.env}-infra-app-key"
  public_key = file("/home/sam12rex/Desktop/Terraform-modules-app/terra-key.pub")

}

#VPC & Security Group
resource "aws_default_vpc" "default" {
      
}
resource "aws_security_group" "my-security-group" {
    name = "${var.env}-infra-app"
    description = "this will add a terraform generated security groups"
    vpc_id = aws_default_vpc.default.id #interpolation


    #inbounded rules
    ingress = {
        description = "SSH open"
        form_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress = {
        description = "all access open outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.env}-infra-app"
    }
}

#ec2 instance

resource "aws_instance" "my-instance" {
  count = var.instance-count
  depends_on = [ aws_security_group.my-security-group,aws_key_pair.my-new-key ]
  key_name = aws_key_pair.my-new-key.key_name
  security_groups = [ aws_security_group.my-security-group.name ]
  instance_type = var.instance_type
  ami = var.ec2-ami-id

  root_block_device {
    volume_size = var.env=="prd"?20:15
    volume_type = "gp3"
  }
  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }

}
