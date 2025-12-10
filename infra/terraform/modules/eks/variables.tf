variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet ids for node groups"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet ids"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type for managed node group"
  type        = string
  default     = "t3.medium"
}

variable "node_group_desired" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Min nodes"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Max nodes"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags applied to EKS resources"
  type        = map(string)
  default     = {}
}
