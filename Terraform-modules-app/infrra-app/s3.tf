
resource "aws_s3_bucket" "remote_s3"{
    bucket = "${var.env}-${var.bucket-names}"
    tags = {
      name = "${var.env}-${var.bucket-names}"
      Environment = var.env
    }
}