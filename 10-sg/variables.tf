variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "dev"
}

variable "frontend_sg_name" {
    default = "frontend"
  
}

variable "frontend_sg_description" {
    default = " Created sg for frontend instance"
  
}

variable "bastion_sg_name" {
    default = "bastian"
  
}

variable "bastion_sg_description" {
    default = " Created sg for bastian instance"
  
}

variable "backend_alb_name" {
    default = "backend-alb"
  
}

variable "backend_alb_description" {
    default = " for backend alb"
  
}

variable "mongodb_ports_vpn" { # just keep as mongodb_ports
    default = [22, 27017]
}

variable "redis_ports_vpn" {
    default = [22, 6379]
}

variable "mysql_ports_vpn" {
    default = [22, 3306]
}

variable "rabbitmq_ports_vpn" {
    default = [22, 5672]
}