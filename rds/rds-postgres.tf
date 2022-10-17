module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "kong-pg13"

  engine            = "postgres"
  engine_version    = "11.16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  max_allocated_storage = 30
  db_name  = "kong"
  username = "kong_user"
  password = "12345678"
  storage_type = "gp2"
  publicly_accessible = false
  port     = "5432"
  availability_zone = "us-east-1a"
  network_type = "DUAL"
  
  iam_database_authentication_enabled = false

  vpc_security_group_ids = ["sg-0478c47b099b48f8e"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  performance_insights_enabled = true
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = ["subnet-083ee30bfe79496ac", "subnet-08ae687f479d6544e", "subnet-0f337252c7baa2b20", "subnet-093c431d9db5d8562", "subnet-0a6b97a92f1c071bb", "subnet-0101545d43a467f5b", "subnet-008f1a536a8623779", "subnet-0c7a037f62ba336df", "subnet-058e500f0b866e68b"]

  # DB parameter group
  family = "postgres11"
  
  # Database Deletion Protection
  deletion_protection = false

}
