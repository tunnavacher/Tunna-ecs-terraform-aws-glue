resource "aws_glue_catalog_database" "glue_catalog_database" {
  name = var.glue_database
}

resource "aws_glue_crawler" "crawler" {
  database_name = aws_glue_catalog_database.glue_catalog_database.name
  name          = var.s3_crawler
  role          = "arn:aws:iam::732107147698:role/AWSGlueServiceRole"
  s3_target {
    path = "s3://${var.bucket_name}"
  }
}
