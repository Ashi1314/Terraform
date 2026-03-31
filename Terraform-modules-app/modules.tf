module "dev-infra" {
    source = "/home/sam12rex/Desktop/Terraform-modules-app/infrra-app"  
    env = "Development"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ec2-ami-id = ""
    hash_key = "StudentID"
}
module "production-infra" {
    source = "/home/sam12rex/Desktop/Terraform-modules-app/infrra-app"  
    env = "Production"
    bucket_name = "infra-app-bucket"
    instance_count = 2
    instance_type = "t2.micro"
    ec2-ami-id = ""
    hash_key = "StudentID"
}
module "Staging-infra" {
    source = "/home/sam12rex/Desktop/Terraform-modules-app/infrra-app"  
    env = "Staging"
    bucket_name = "infra-app-bucket"
    instance_count = 3
    instance_type = "t2.micro"
    ec2-ami-id = ""
    hash_key = "StudentID"
}