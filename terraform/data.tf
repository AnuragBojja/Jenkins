data "aws_ami" "roboshop_ami" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_route53_zone" "selected" {
  name         = "anuragaws.shop"
}

data "aws_ami" "sonarQube" {
  most_recent = true
  owners      = ["679593333241"] # Solve DevOps

  filter {
    name   = "name"
    values = ["SolveDevOps-SonarQube-Server-Ubuntu24.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}