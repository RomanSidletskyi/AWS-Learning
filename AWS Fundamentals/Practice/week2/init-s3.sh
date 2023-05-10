aws s3api create-bucket --bucket rsidletskyi-aws-fundamentals --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-bucket-versioning --bucket rsidletskyi-aws-fundamentals --versioning-configuration Status=Enabled

aws s3 cp test.txt s3://rsidletskyi-aws-fundamentals/test.txt --content-type text/plain
