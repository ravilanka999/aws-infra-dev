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

module "backend_alb" {
    #source = "../../terraform-aws-securitygroup-module"
    source =  "git::https://github.com/ravilanka999/terraform-aws-securitygroup-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.backend_alb_name
    sg_description = var.backend_alb_description
    vpc_id = local.vpc_id
}

module "vpn" {
    #source = "../../terraform-aws-securitygroup-module"
    source =  "git::https://github.com/ravilanka999/terraform-aws-securitygroup-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "vpn"
    sg_description = "for vpn"
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

# backend ALB accepting traffic from my bastian host on port 80
resource "aws_security_group_rule" "backend_alb_bastian" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastian.sg_id
  security_group_id = module.backend_alb.sg_id
}

# backend ALB accepting traffic from vpn
resource "aws_security_group_rule" "backend_alb_vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id = module.backend_alb.sg_id
}

#VPN ports 22, 443, 1194, 943 ----> VPN ports
resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}