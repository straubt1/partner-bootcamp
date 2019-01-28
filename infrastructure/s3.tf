resource "aws_s3_bucket" "main" {
  // bucket = "${local.env_random}-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "main" {
  bucket = "${aws_s3_bucket.main.id}"
  key    = "alcatraz_image"
  source = "./img/alcatraz.jpg"
  etag   = "${md5(file("./img/alcatraz.jpg"))}"
}
