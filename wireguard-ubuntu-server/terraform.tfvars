ec2_name            = "vpn-wg-server"
ami_id              = "ami-0574da719dca65348" #ubuntu 22.04 x64
instance_type       = "t3.small"
region              = "us-east-1b" #virginia
key_name            = "l1q_key"
security_group_id   = ["sg-008d650fa174f6032"] #webssh
subnet_id           = "subnet-008f1a536a8623779" #public 10.20.12.x