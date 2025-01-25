resource "aws_lb" "my-elb" {
  name = "my-elb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.allow_tls.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

}

resource "aws_lb_target_group" "myTG" {
  name     = "tf-example-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc1.id
  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.myTG.arn
  target_id = aws_instance.myinstance.id
  port = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.myTG.arn
  target_id = aws_instance.myinstance2.id
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my-elb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.myTG.arn
    type = "forward"
  }
}

output "lbdnsname" {
  value = aws_lb.my-elb.dns_name
}