module "vpc" {
    source = "./modules/aws_vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
}

module "subnet" {
    source = "./modules/aws_subnet"
    vpc_id = module.vpc.vpc_id
    subnet_cidr = var.subnet_cidr
    subnet_name = var.subnet_name
}

module "sg" {
    source = "./modules/aws_sg"
    /*vpc_id = module.vpc.vpc_id*/
    sg_name = var.sg_name
}

module "nic" {
    source = "./modules/aws_nic"
    for_each = var.instance_config
    subnet_id = module.subnet.subnet_id
    nic_name = each.value.nic_name
    private_ips = each.value.private_ips
}


module "instance" {
    source = "./modules/aws_instance"

    depends_on = [
        module.nic
    ]
    for_each = var.instance_config
    instance_ami = each.value.instance_ami
    instance_type = each.value.instance_type
    instance_name = each.value.instance_name
    nic_id = module.nic[each.key].nic_id
}


/*
module "nic" {
    source = "./modules/aws_nic"
    subnet_id = module.subnet.subnet_id
    nic_name = var.nic_name
    private_ips = var.private_ips
}


module "instance_southeast_1" {
    source = "./modules/aws_instance"
    instance_ami = var.instance_ami
    instance_type = var.instance_type
    instance_name = var.instance_name
    nic_id = module.nic.nic_id
}

module "instance_east_1" {
    source = "./modules/aws_instance"
    providers = {
        aws = aws.east-1
    }
    
    instance_ami = var.instance_ami
    instance_type = var.instance_type
    instance_name = var.instance_name
    nic_id = module.nic.nic_id
}
*/