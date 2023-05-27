#output "green-alb-target-group-arn" {
#  value       = aws_lb_target_group.green.arn
#  description = "The ARN of the green target group."
#}
#

#output "blue-alb-target-group-arn" {
#  value       = aws_lb_target_group.blue.arn
#  description = "The ARN of the blue target group."
#}
#
#output "alb-dns-name" {
#  value       = aws_lb.gathering_alb.dns_name
#  description = "The DNS name of the load balancer."
#}
#
#output "alb-security-group" {
#  value       = aws_security_group.alb_sg.id
#  description = "The loab balancer security group."
#}
#
#output "target_blue" {
#  value       = aws_lb_target_group.blue.name
#  description = "Blue target group name."
#}
#
#output "target_green" {
#  value       = aws_lb_target_group.green.name
#  description = "Green target group name."
#}
#
#output "aws_lb_listener_rule_api_arn" {
#  value       = aws_lb_listener.api.arn
#  description = "The ARN of load balancer rule."
#}
#
##output "aws_lb_listener_rule_redirect_arn" {
##  value       = aws_lb_listener.redirect.arn
##  description = "The ARN of load balancer rule."
##}
#
#output "aws_lb_zone_id" {
#  value       = aws_lb.gathering_alb.zone_id
#  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
#}
#
