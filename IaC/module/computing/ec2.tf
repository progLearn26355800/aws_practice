resource tls_private_key private_key {
    algorithm = "RSA"
    rsa_bits = 2048
}

locals {
    public_key_file =  "../../ssh_key/${var.key_name}.pub"
    private_key_file = "../../ssh_key/${var.key_name}"
}

resource "local_file" "private_key_pem" {
    filename = local.private_key_file
    content = tls_private_key.private_key.private_key_pem
}


resource "aws_key_pair" "keypair" {
    key_name = var.key_name
    public_key = tls_private_key.private_key.public_key_openssh
}

resource "aws_instance" "ec2" {
    ami = "ami-0062dbf6b829f04e1"
    instance_type = "t2.micro"
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [
        aws_security_group.ec2_sg.id
    ]
    key_name = aws_key_pair.keypair.id
    iam_instance_profile = aws_iam_instance_profile.systems_manager.name
    tags = {
        Name = "hogehogeServer"
    }

    depends_on = [
        aws_iam_instance_profile.systems_manager
    ]
}
