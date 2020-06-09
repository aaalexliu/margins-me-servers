output "ping_security_group_id" {
  value = "${module.ping_sg.this_security_group_id}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "database_subnets_ids" {
  value = "${module.vpc.database_subnets}"
}

output "db_connection_endpoint" {
  value = "${module.rds.this_db_instance_endpoint}"
}

output "db_name" {
  value = "${module.rds.this_db_instance_name}"
}

output "db_username" {
  value = "${module.rds.this_db_instance_username}"
}

output "db_password" {
  value = "${module.rds.this_db_instance_password}"
}

output "db_port" {
  value = "${module.rds.this_db_instance_port}"
}

resource "local_file" "lambda-env" {
  sensitive_content = <<-EOT
  POSTGRES_DB="${module.rds.this_db_instance_name}"
  POSTGRES_USER="${module.rds.this_db_instance_username}"
  POSTGRES_PASSWORD="${module.rds.this_db_instance_password}"

  DATABASE_URL="postgres://$${POSTGRES_USER}:$${POSTGRES_PASSWORD}@localhost:5432/$${POSTGRES_DB}"
  DATABASE_ENDPOINT="${module.rds.this_db_instance_endpoint}"

  AWS_VPC_SECURITY_GROUP_IDS="${module.ping_sg.this_security_group_id}"
  AWS_VPC_SUBNET_IDS="${join(",", module.vpc.database_subnets)}"

  EOT

  filename = abspath("${path.module}/../margins-me-serverless-resources/services/graphql-lambda/.db-env")
  # filename = "${path.module}/temp"
}
