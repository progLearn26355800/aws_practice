data http ifconfig {
    url = "http://ipv4.icanhazip.com/"
}

locals {
    current-ip = chomp(data.http.ifconfig.body)
    allowed-cidr = (var.allowed-cidr == null) ? "${local.current-ip}/32" : var.allowed-cidr
}

resource aws_security_group ec2_sg {
    name = "handson-ec2-sg"
    description = "for EC2 Linux"
    vpc_id = var.output_vpc_id
    tags = {
        Name = "handson-ec2-sg"
    }
}

resource "aws_security_group_rule" "in_ssh" {
    security_group_id = aws_security_group.ec2_sg.id
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [local.allowed-cidr]
}

resource "aws_security_group_rule" "in_icmp" {
    security_group_id = aws_security_group.ec2_sg.id
    type = "ingress"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "out_all" {
    security_group_id = aws_security_group.ec2_sg.id
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
