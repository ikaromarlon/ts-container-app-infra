# ts-container-app-infra
The infrastructure for the application [ts-container-app](https://github.com/ikaromarlon/ts-container-app)

[![CI](https://github.com/ikaromarlon/ts-container-app-infra/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/ikaromarlon/ts-container-app-infra/actions/workflows/main.yml)

### Pourpose
Build a simple cloud infrastructure on AWS managed by Terraform and deployed everytime the *main* branch is updated, using CI/CD concepts running on Github Actions.

#### Stack
  - IaC: [Terraform](https://www.terraform.io/)
  - Cloud: [AWS](https://aws.amazon.com)
  - Containers: [AWS ECS](https://aws.amazon.com/ecs/)
  - CI/CD: [Github Actions](https://github.com/features/actions)