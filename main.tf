# configure aws provider
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}
# This is so we can let terraform know which VPC we would like to work with
data "aws_vpc" "Deployment-4-vpc" {
  id = "vpc-0ddd8b37b13bafc56"
}

# create instance
resource "aws_instance" "Deployment4_ec2_2" {
  # input what OS ID you will use
  ami = "ami-053b0d53c279acc90"
  # input the instance type according to business needs
  instance_type = "t2.medium"
  # input which subnet the EC2 will be linked to 
  subnet_id = "subnet-0df0d8d9075062575"
  # input what security group the EC2 will utilize 
  vpc_security_group_ids = ["sg-0eec38be6cd7db890"]
  # Input which keypair the EC2 will require
  key_name = "KevinGonzalez623key"
  # This is if the EC2 needs a public IP, by default this is false
  associate_public_ip_address = true
  # This will run "deploy.sh" when the EC2 is created
  user_data = "${file("deploy.sh")}"

  tags = {
    "Name": "Deployment4_ec2_2"
  }
}
# request an output of the IP address of the newly created EC2
output "instance_ip" {
  value = aws_instance.Deployment4_ec2_2.public_ip
}
