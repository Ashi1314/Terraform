resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name = "${var.env}-infra-app-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"

  attribute {
    name = var.hash-key
    type = "S"
  }
  tags = {
    name = "${var.env}-infra-app-table"
    Environment = var.env
  }
}