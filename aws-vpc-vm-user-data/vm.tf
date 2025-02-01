resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = file("./aws-key.pub")

}
resource "aws_instance" "vm" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  subnet_id                   = aws_subnet.subnet.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.aws_key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  user_data                   = file("./docs/docker.sh")
  tags = {
    Name = "vm-terraform"
  }
}
