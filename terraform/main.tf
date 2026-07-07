resource "aws_instance" "jenkins" {
  ami = data.aws_ami.roboshop_ami
  instance_type = t3.small
  vpc_security_group_ids = [ aws_security_group.jenkins ]
  subnet_id = "subnet-0d667c040add6be29"
  user_data = file("./jenkins.sh")
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-jenkins"
    }
  )
}

resource "aws_instance" "jenkins-agent" {
  ami = data.aws_ami.roboshop_ami
  instance_type = t3.small
  vpc_security_group_ids = [ aws_security_group.jenkins-agent ]
  subnet_id = "subnet-0d667c040add6be29"
  user_data = file("./jenkins-agent.sh")
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-jenkins-agent"
    }
  )
}

resource "aws_route53_record" "jenkins" {
  zone_id = local.zone_id
  name    = "jenkins.anuragaws.shop"
  type    = "A"
  ttl     = 1
  records = [aws_instance.jenkins.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "jenkins-agent" {
  zone_id = local.zone_id
  name    = "jenkins-agent.anuragaws.shop"
  type    = "A"
  ttl     = 1
  records = [aws_instance.jenkins-agent.private_ip]
  allow_overwrite = true
}