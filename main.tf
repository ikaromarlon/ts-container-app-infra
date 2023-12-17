terraform {
  required_version = "~> 1.6"

  backend "s3" {
    bucket         = "977807728480-terraform"
    key            = "state/ts-container-app.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "ecrRepository" {
  source              = "./modules/ecr"
  ecr_repository_name = local.app_name
}

# module "ecsCluster" {
#   source = "./modules/ecs"

#   ecs_cluster_name             = "${local.app_name}-cluster"
#   ecs_service_name             = "${local.app_name}-service"
#   ecs_task_family              = local.app_name
#   ecs_task_name                = local.app_name
#   ecs_task_execution_role_name = "${local.app_name}-task-execution-role"
#   ecr_repo_url                 = module.ecrRepository.repository_url

#   availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
#   container_port     = 3000

#   application_load_balancer_name = "${local.app_shortName}-alb"
#   target_group_name              = "${local.app_shortName}-alb-tg"
# }