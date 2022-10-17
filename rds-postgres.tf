module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "postgres"
  engine_version    = "11.16"
  instance_class    = "db.t4g.micro"
  allocated_storage = 20

  db_name  = "kong-pg11"
  username = "kong_user"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-0478c47b099b48f8e"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = ["subnet-083ee30bfe79496ac", "subnet-08ae687f479d6544e", "subnet-0f337252c7baa2b20", "subnet-093c431d9db5d8562", "subnet-0a6b97a92f1c071bb", "subnet-0101545d43a467f5b", "subnet-008f1a536a8623779", "
subnet-0c7a037f62ba336df", "subnet-058e500f0b866e68b"]

  # DB parameter group
  family = "postgres11"

  option_group_name = "postgres-11"

  # Database Deletion Protection
  deletion_protection = false

}
