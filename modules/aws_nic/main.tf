#------------------ AWS NIC Attached to AWS INstance --------------
resource "aws_network_interface" "my_nic" {
    subnet_id = var.subnet_id
    private_ips = var.private_ips

    tags = var.nic_name
}

