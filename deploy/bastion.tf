data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.bastion.id]
  subnet_id                   = aws_subnet.mathops_public_subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mathops_key.key_name

  tags = merge(
    local.common_tags,
    tomap({ "Name" = "${local.prefix}-bastion" })
  )
}
