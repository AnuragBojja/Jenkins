resource "aws_security_group" "jenkins" {
  name = "${local.common_name}-jenkins"
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-jenkins"
    }
  )
}

resource "aws_vpc_security_group_egress_rule" "jenkins" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "jenkins" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_security_group" "jenkins-agent" {
  name = "${local.common_name}-jenkins-agent"
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-jenkins-agent"
    }
  )
}

resource "aws_vpc_security_group_egress_rule" "jenkins-agent" {
  security_group_id = aws_security_group.jenkins-agent.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "jenkins-agent" {
  security_group_id = aws_security_group.jenkins-agent.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}