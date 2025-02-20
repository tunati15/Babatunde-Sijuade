module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "18.14.0"
    cluster_name = "domo-project-1-eks-cluster"
    cluster_version = "1.26"

    cluster_endpoint_public_access  = true

    vpc_id = module.domo-project-1-vpc.vpc_id
    subnet_ids = module.domo-project-1-vpc.private_subnets

    tags = {
        environment = "development"
        application = "domo-project-1"
    }

    eks_managed_node_groups = {
        poker = {
            min_size = 1
            max_size = 2
            desired_size = 2

            instance_types = ["t2.small"]
        }
    }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
