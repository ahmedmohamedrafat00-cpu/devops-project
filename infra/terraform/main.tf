resource "aws_s3_bucket" "terraform_state" {
  bucket        = "devops-project-tf-state-ahmed-001"
  force_destroy = true

  tags = {
    Name        = "devops-project-tf-state-ahmed"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-locks"
  }
}
module "vpc" {
  source = "./modules/vpc"

  name       = "${var.project_name}-network"
  cidr_block = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  tags = {
    Project     = var.project_name
    Environment = "dev"
  }
}
module "eks" {
  source = "./modules/eks"

  cluster_name        = "${var.project_name}-eks"
  region              = var.aws_region
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids

  node_instance_type  = "t3.medium"
  node_group_desired  = 2
  node_group_min      = 1
  node_group_max      = 3

  tags = {
    Project     = var.project_name
    Environment = "dev"
  }
}
