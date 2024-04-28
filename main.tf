provider "aws" {
    region = var.region
}

data "aws_subnet" "this"{
    id = var.subnetid
}

resource "aws_network_interface" "this" {
    subnet_id        = data.aws_subnet.this.id
    private_ips      = ["10.0.1.100"]
}

resource "aws_instance" "this" {
    ami             = var.instance_ami
    instance_type   = var.instance_type


    tags = {
    Name = "toluec2"
  }


    network_interface {
        device_index            = 0
        network_interface_id    = aws_network_interface.this.id
    }

   
}

