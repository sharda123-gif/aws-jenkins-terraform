provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0866a3c8686eaeeba" # Replace with your desired AMI ID
  instance_type = "t2.micro"

  # Adding a Key Pair for SSH Access
  key_name = "Devops-Shack-key" # Replace with your key pair name

  # Tags for the instance
  tags = {
    Name = "MyEC2Instance"
  }
}