resource "aws_iam_instance_profile" "ec2-instance-profile" {
  name = "ec2-instance-profile"
  role = "ec2-write-iam-role"
}
resource "aws_key_pair" "key" {
  key_name   = "deployer-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.vpc_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Allow_ssh.id, aws_security_group.allow_port8080.id]
  user_data                   = file("./docs/docker.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2-instance-profile.name
  tags = {
    Name = "Terraform-vm-${var.environment}"
  }
}

# Resource para criar o arquivo de inventario usando no ansible
resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.tpl", { instance_ip = aws_eip.eip.public_ip })
  filename = "${path.module}/inventory.ini"
}

# # Criar a Role para a EC2
# resource "aws_iam_role" "ec2_s3_write" {
#   name = "ec2_s3_write_role"
#
#   assume_role_policy = <<EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Principal": {
#           "Service": "ec2.amazonaws.com"
#         },
#         "Action": "sts:AssumeRole"
#       }
#     ]
#   }
#   EOF
# }
#
# # Associar a política à Role
# resource "aws_iam_role_policy_attachment" "s3_write_attach" {
#   policy_arn = var.arn-s3-terraform
#   role       = aws_iam_role.ec2_s3_write.name
# }
#
# # Criar a Instance Profile e associar à Role
# resource "aws_iam_instance_profile" "ec2_s3_profile" {
#   name = "ec2_s3_profile"
#   role = aws_iam_role.ec2_s3_write.name
# }
#
