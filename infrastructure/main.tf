# HCL - Hashicorp Configuration Language
#linguagem declarativa

# para rodar: 
#terraform init
#terraform fmt
#terraform validate
# terraform plan --plano de execução do deploy da nossa infra
# terraform destroy

resource "aws_s3_bucket" "datalake" {
  #parâmetros de config do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.env}"

  tags = { IES = "IGTI",
  CURSO = "EDC" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_example" {
  bucket = aws_s3_bucket.datalake.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_object" "job_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../mod1_basics/job_spark.py"
  etag   = filemd5("../mod1_basics/job_spark.py") #controle de estado para não fazer upload do object toda vez, só qnd muda
}

provider "aws" {
  region = "us-west-2"
}