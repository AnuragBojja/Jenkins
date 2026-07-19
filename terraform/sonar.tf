resource "aws_instance" "sonarQube" {
  count = var.sonar ? 1 : 0
  ami = local.sonarQube_ami_id
  instance_type = "t3.large"
  vpc_security_group_ids = [ aws_security_group.sonarQube[0].id ]
  subnet_id = "subnet-0d667c040add6be29"
  key_name = "daws-86s"
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-sonarQube"
    }
  )
}

resource "aws_security_group" "sonarQube" {
  count = var.sonar ? 1 : 0
  name = "${local.common_name}-sonarQube"
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-sonarQube"
    }
  )
}
resource "aws_vpc_security_group_egress_rule" "sonarQube" {
  count = var.sonar ? 1 : 0
  security_group_id = aws_security_group.sonarQube[0].id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "sonarQube" {
  count = var.sonar ? 1 : 0
  security_group_id = aws_security_group.sonarQube[0].id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_route53_record" "sonarQube" {
  count = var.sonar ? 1 : 0
  zone_id = local.zone_id
  name    = "sonarQube.anuragaws.shop"
  type    = "A"
  ttl     = 1
  records = [aws_instance.sonarQube[0].public_ip]
  allow_overwrite = true
}