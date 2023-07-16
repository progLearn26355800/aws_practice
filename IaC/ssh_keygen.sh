mkdir ssh_key
ssh-keygen -t rsa -f ./ssh_key/id_rsa_ec2
cp -ap ./ssh_key/id_rsa_ec2 ./ssh_key/id_rsa_ec2.pem
ssh-keygen -p -m pem -f ./ssh_key/id_rsa_ec2.pem
chmod 600 ./ssh_key/id_rsa_ec2.pem
