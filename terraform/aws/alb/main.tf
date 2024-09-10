provider "aws" {
  region = "us-east-1" # Change the region as per your needs
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-internet-gateway"
  }
}

# Create a Route Table for the VPC
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-route-table"
  }
}

# Create Subnets
resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" # Adjust as needed
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b" # Adjust as needed
}

# Associate Subnets with the Route Table to Allow Internet Access
resource "aws_route_table_association" "subnet_1_association" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route_table_association" "subnet_2_association" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.my_route_table.id
}

# Security Group for EC2 Instances
resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

# Launch Two EC2 Instances with Apache HTTPD Installed
resource "aws_instance" "web_1" {
  ami           = "ami-0182f373e66f89c85" # Replace with a valid Amazon Linux 2 AMI in your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_http.id] # Update to use vpc_security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from Web Server 1" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Web Server 1"
  }
}

resource "aws_instance" "web_2" {
  ami           = "ami-0182f373e66f89c85" # Replace with a valid Amazon Linux 2 AMI in your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_2.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_http.id] # Update to use vpc_security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from Web Server 2" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Web Server 2"
  }
}

# Create an Application Load Balancer
resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  enable_deletion_protection = false

  tags = {
    Name = "my-lb"
  }
}

# Create a Target Group
resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Attach EC2 instances to the target group
resource "aws_lb_target_group_attachment" "web_1" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.web_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_2" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.web_2.id
  port             = 80
}

# Create a Listener for the Load Balancer
resource "aws_lb_listener" "my_lb_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Output the Load Balancer's DNS name
output "load_balancer_dns" {
  value = aws_lb.my_lb.dns_name
}

