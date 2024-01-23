resource "aws_instance" "instance1" {
  ami           = "ami-0005e0cfe09cc9050"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"

  tags = {
    Name = "Free Tier Instance 1"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-0005e0cfe09cc9050"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"

  tags = {
    Name = "Free Tier Instance 2"
  }
}