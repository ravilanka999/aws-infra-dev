module "frontend" {
    #source = "../../terraform-aws-securitygroup-module"
    source =  "git::https://github.com/ravilanka999/terraform-aws-securitygroup-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.front_sg_description
    vpc_id = local.vpc_id
}