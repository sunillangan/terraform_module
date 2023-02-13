#---------------------- AWS SG attached to AWS VPC ---------------------
resource "aws_security_group" "my_sg" {
    name              =   "allow_tls_gr"
    description       =   "Allow TLS inbound traffic"
   /* vpc_id            =   var.vpc_id*/

    ingress {
        from_port     =   443
        to_port       =   443
        description   =   "TLS from VPC"
        protocol      =   "tcp"
        cidr_blocks   =   ["0.0.0.0/0"]
    }

    egress {
        from_port         =  0
        to_port           =  0
        description       =  "TLS from VPC"
        protocol          =  "-1"
        cidr_blocks       =  ["0.0.0.0/0"]
        ipv6_cidr_blocks  =  ["::/0"]
    }

    tags = var.sg_name

}

