variable "vpc_cidr" {
    description = "CIDR for VPC"
    type = string
}

variable "tags" {
    type = map(string)
}

variable "AZ" {
    description = "Availability Zone"
    type = string
}

variable "subnet1_cidr_block" {
    description = "subnet cidr"
    type = string
}

variable "destination_cidr_block" {
    type = string
    description = "destination cidr"
}

 variable "instance_type" {
     description = "instance type"
     type = string
}