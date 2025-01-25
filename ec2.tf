resource "aws_instance" "myinstance" {
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.subnet1.id
  user_data = base64encode(file("userdata.sh"))
}

resource "aws_instance" "myinstance2" {
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.subnet2.id
  user_data = base64encode(file("userdata1.sh"))
}