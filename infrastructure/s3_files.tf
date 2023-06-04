resource "aws_s3_object" "job_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_prepare_data_rais.py"
  acl    = "private"
  source = "../etl/01_spark_insert.py"
  etag   = filemd5("../etl/01_spark_insert.py") #controle de estado para não fazer upload do object toda vez, só qnd muda
}
