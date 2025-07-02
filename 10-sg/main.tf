module "frontend" {
    #source = "../../terraform-aws-securitygroup-module"
    source =  "git::https://github.com/ravilanka999/terraform-aws-securitygroup-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    vpc_id = local.vpc_id
}

module "bastian" {
    #source = "../../terraform-aws-securitygroup-module"
    source =  "git::https://github.com/ravilanka999/terraform-aws-securitygroup-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.bastian_sg_name
    sg_description = var.bastian_sg_description
    vpc_id = local.vpc_id
}

# bastian accepting connections from my laptop
resource "aws_security_group_rule" "bastian" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastian.sg_id
}