output "ping_security_group_id" {
  value = "${module.ping_sg.this_security_group_id}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
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