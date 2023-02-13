variable "subnet_cidr" {
    type = string
    default = "172.16.10.0/24"
}

variable "subnet_name" {
    type = map(any)
    default = {
      Name    =   "tf-example"
    }
}

variable "avail_zone" {
  type = string
  default = "ap_southeast-1a"
}

variable "vpc_id" {
    type = string
}