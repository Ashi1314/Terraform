#Key pair(login)

resource "aws_key_pair" "deployer" {
    key_name="terra-key"
    public_key = file("terra-key.pub") 
}

#VPC Security Group
resource "aws_default_vpc" "default"{

}

resource "aws_security_group" "my-security-groups" {
  name        = "automate-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id


#inbounded rules
ingress = {
    from_ports=22
    to_port=22
    protocol="tcp"
    cidr_block=["0.0.0.0/0"]
    description="ssh open"
}


#outbounded rules
egress = {
    from_ports=0
    to_port=0
    protocol="-1"
    cidr_block=["0.0.0.0/0"]
    description="all access open outbound"
}
  tags = {
    Name = "automate-sg"
  }
}

#ec2 instance
resource "aws_instance" "my-instance" {
    key_name = aws_key_pair.deployer.key_name
    security_groups = [ aws_security_group.my-security-groups.name ]
    instance_type = "t2.micro"//var.ec2_instance_type
    ami = ""//var.ec2_ami_id
    
    root_block_device {
      volume_size = var.ec2_root_stroge_size //10
      volume_type = "gb3"
    }
    tags = {
      Name="terraform-automate"
    }
  
}
