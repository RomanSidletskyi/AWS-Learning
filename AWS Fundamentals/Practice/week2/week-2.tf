terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

variable "ec2_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Week-2-ic2"
}

variable "ec2_ami_id" {
  description = "Ami id for the ec2 instance"
  type        = string
  default     = "ami-04e914639d0cca79a"
}

variable "ec2_instance_type" {
  description = "Instance type of the EC2 Instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_vpc" {
  description = "VPC for EC2 security group"
  type        = string
  default     = "vpc-0b5a04229c7b065da"
}

variable "ec2_key_name" {
  description = "Name for an existing key pair"
  type        = string
  default     = "rsidletskyi-key-pair"
}

variable "aws_s3_bucket_name" {
  description = "Name of the bucket to download files from"
  type        = string
  default     = "sidletskyi-aws-fundamentals"
}

resource "aws_iam_role" "ec2_s3_access_role" {
  name = "EC2-S3-Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name = "EC2-S3-Access-Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : ["arn:aws:s3:::${var.aws_s3_bucket_name}"]
      },
      {
        Effect   = "Allow"
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::${var.aws_s3_bucket_name}/*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ec2_role_s3_policy_attachment" {
  name       = "EC2-Role-S3-Policy-Attachment"
  roles      = [aws_iam_role.ec2_s3_access_role.name]
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "EC2-S3-Profile"
  role = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_security_group" "ec2_security_group" {
  name        = format("%s-%s", var.ec2_name, "Security-Group")
  description = "Allow SSL and HTTP inbound traffic and outbound all traffic"
  vpc_id      = var.ec2_vpc

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_week_2" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_key_name
  iam_instance_profile   = aws_iam_instance_profile.ec2_s3_profile.name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  user_data              = <<-EOF
    #!/bin/bash -x
    aws s3 cp s3://${var.aws_s3_bucket_name}/ ./ --recursive
  EOF

  tags = {
    Name = var.ec2_name
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_week_2.public_ip
}

