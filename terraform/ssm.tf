resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project_name}/${var.env}/jenkins_agent_sg_id"
  type  = "String"
  value = aws_security_group.jenkins-agent.id
}
