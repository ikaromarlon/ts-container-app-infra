terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

module "ecrRepository" {
  source              = "./modules/ecr"
  ecr_repository_name = local.ecr_repository_name
}

module "ecsCluster" {
  source = "./modules/ecs"

  ecs_cluster_name             = local.ecs_cluster_name
  ecs_task_family              = local.ecs_task_family
  ecs_task_name                = local.ecs_task_name
  ecs_task_execution_role_name = local.ecs_task_execution_role_name
  esc_service_name             = local.esc_service_name
  ecr_repo_url                 = module.ecrRepository.repository_url

  availability_zones = local.availability_zones
  container_port     = local.container_port

  application_load_balancer_name = local.application_load_balancer_name
  target_group_name              = local.target_group_name
}