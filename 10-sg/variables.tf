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

variable "bastian_sg_name" {
    default = "bastian"
  
}

variable "bastian_sg_description" {
    default = " Created sg for bastian instance"
  
}