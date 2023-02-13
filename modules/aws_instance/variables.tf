
variable "instance_ami" {
    type = string
    default = "ami-082b1f4237bd816a1"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    type = map(any)
    default = {
      Name    =   "Test instance"
    }
}

variable "nic_id" {
    type = string
}