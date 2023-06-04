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
