resource "aws_instance" "knightec2" {
  
  instance_type = "t2.micro"
  key_name = "knight-dev"
  ami = var.ami

}
resource "aws_security_group" "knightec2sg" {
  name        = "knightec2sg"
  description = "Allow traffic on ports 22 (SSH) and 80 (HTTP)"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.169.145.182/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["122.169.145.182/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}