 # configure aws provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}
# create instance
resource "aws_instance" "Deployment4_ec2_2" {
  # input what OS ID you will use
  ami = var.ami
  # input the instance type according to business needs
  instance_type = var.instance_type
  # input which subnet the EC2 will be linked to 
  subnet_id = var.subnet_id
  # input what security group the EC2 will utilize 
  vpc_security_group_ids = var.vpc_security_group_ids
  # Input which keypair the EC2 will require
  key_name = var.key_name
  # This is if the EC2 needs a public IP, by default this is false
  associate_public_ip_address = true
  # This will run "deploy.sh" when the EC2 is created
  user_data = "${file("deploy.sh")}"
  # Because a security group can only be connected to one vpc, when we reference the security group terraform will know which vpc to use 
  tags = {
    "Name": var.Instance_Name
  }
}
# request an output of the IP address of the newly created EC2
output "instance_ip" {
  value = aws_instance.Deployment4_ec2_2.public_ip
}
