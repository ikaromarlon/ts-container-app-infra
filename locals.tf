locals {
  app_name      = "ts-container-app"
  app_shortName = "tca" # for resources that have more restricted name length

  ecr_repository_name = local.app_name

  ecs_cluster_name             = "${local.app_name}-cluster"
  esc_service_name             = "${local.app_name}-service"
  ecs_task_family              = local.app_name
  ecs_task_name                = local.app_name
  ecs_task_execution_role_name = "${local.app_name}-task-execution-role"

  container_port = 3000

  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  application_load_balancer_name = "${local.app_shortName}-alb"
  target_group_name              = "${local.app_shortName}-alb-tg"
}