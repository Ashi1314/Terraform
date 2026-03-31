
variable "ec2_instance_type" {
    default = "t2.micro"
    type = string
  
}
variable "ec2_root_stroge_size" {
    default = 16
    type = number
  
}
variable "ec2_ami_id" {
    default = ""
    type = string
  
}