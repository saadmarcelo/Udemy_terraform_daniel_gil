resource "aws_key_pair" "key" {
  key_name   = "deployer-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.vpc_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Allow_ssh.id, aws_security_group.allow_port80.id]
  user_data                   = file("./docs/docker.sh")
  tags = {
    Name = "Terraform-vm"
  }
}
