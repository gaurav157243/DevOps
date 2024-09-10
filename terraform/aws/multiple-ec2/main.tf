provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet for private instances
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = false  # Disable public IP
}

# Security Group (open port 22 for SSH access, you can modify this as needed)
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.example_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Access only within the VPC
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create 5 EC2 Instances with Private IP Addresses
resource "aws_instance" "private_instances" {
  count = var.ec2-count # Creates 5 instances
  ami           = "ami-0182f373e66f89c85" # Replace with your preferred AMI ID
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  private_ip = cidrhost(aws_subnet.private_subnet.cidr_block, count.index + 10) # Assigns unique private IPs
  associate_public_ip_address = false  # Ensure no public IPs

  tags = {
    Name = "Private-Instance-${count.index + 1}"
  }
}

# Output the private IPs of the instances
output "private_ips" {
  value = aws_instance.private_instances[*].private_ip
}
