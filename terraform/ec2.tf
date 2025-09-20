resource "aws_security_group" "expense_sg" {
  name        = "expense-sg"
  description = "Allow 5000 and SSH"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
}

resource "aws_instance" "expense_tracker" {
  ami                    = "ami-08c40ec9ead489470" # Ubuntu 22.04 LTS (us-east-1)
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.expense_sg.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "ExpenseTrackerEC2"
  }
}
