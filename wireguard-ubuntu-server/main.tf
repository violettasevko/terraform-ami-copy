module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.ec2_name

  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = var.region
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_group_id
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  root_block_device = [{ 
    volume_size = 8
    volume_type = "gp3"
    }]
  
  user_data = file("wginstall")
}
