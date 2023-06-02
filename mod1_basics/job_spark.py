from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)

# ler dados enem 2020
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://datalake-talita-7551561/raw_data/year=2020/microdados_enem_2020/DADOS/MICRODADOS_ENEM_2020.csv")
)

# Salvar em parquet
(
 enem
    .write
    .mode("overwrite")
    .format("parquet")
    .save("s3://datalake-talita-7551561/staging/enem/year=2020")
)