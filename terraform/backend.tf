#create S3
resource "aws_s3_bucket" "s3_backend_store" {
    bucket = "s3backendterraform15"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm   = "AES256"
            }
        }
    }
}



#Create Dynamodb

resource "aws_dynamodb_table" "statelock15"{
     name = "state-lock15"
     billing_mode = "PAY_PER_REQUEST"
     hash_key = "LOCKID"

     attribute {
        name = "LOCKID"
        type = "S"
     }
}
