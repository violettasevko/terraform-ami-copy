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
  subnet_ids             = ["subnet-12345678", "subnet-87654321"]

  # DB parameter group
  family = "mysql5.7"

  option_group_name = "prod-instance-postgresql-11.0"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
