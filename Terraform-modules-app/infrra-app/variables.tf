variable "env"{
    description="this is the environment for staging"
    type= string
}
variable "bucket-names"{
    description="this is bucket name for s3"
    type= string
}
variable "instance-count"{
    description = "this is the no of ec2 instance"
    type = number 
}
variable "ec2-ami-id"{
    description = "this is the instance ami id for my Ec2"
    type=string
}
variable "hash-key"{
    description = "this is the hash key for my dynamodb infra"
    type=string
}
variable "instance_type" {
  description = "this is the instance type of Ec2"
  type = string
}