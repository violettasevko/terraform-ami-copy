resource "aws_lb" "main" {
  name               = "alb-devops" #replace
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = data.terraform_remote_state.vpc.outputs.public_subnets #replace

  tags = { 
    Name = "main-alb" #replace
  } 
} 

resource "aws_lb_listener_rule" "backend" {
  listener_arn = aws_lb_listener.api.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }

  condition {
    path_pattern {
      values = ["/api"] #replace
    }
  }

  tags = {
    Name = "api-listener-rule" #replace
  }

}

resource "aws_lb_listener_rule" "report" {
  listener_arn = aws_lb_listener.report.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.report.arn
  }

  condition {
    path_pattern {
      values = ["/report"] #replace
    }
  }

  tags = {
    Name = "api-listener-rule" #replace
  }

}

resource "aws_lb_target_group" "backend" {
  name        = "backend-lb-tg" #replace
  port        = 80 #replace
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    path                = "/" #replace
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 25
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
}

resource "aws_lb_target_group" "report" {
  name        = "report-lb-tg" #replace
  port        = 80 #replace
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    path                = "/" #replace
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 25
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
}

resource "aws_lb_listener" "report" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.terraform_remote_state.route53.outputs.wildcard_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.terraform_remote_state.route53.outputs.wildcard_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    target_group_arn = aws_lb_target_group.backend.arn

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }


  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg" #replace
  description = "alb-sg-devops" #replace
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-devops"
  }
}
