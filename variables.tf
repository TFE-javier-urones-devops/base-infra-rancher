variable "region" {
  default     = "eu-west-1"
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "rancher-eks-cluster"
}

variable "cluster_version" {
  default     = "1.31"
  description = "Kubernetes version"
  type        = string
}

variable "node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
  default     = 2
}

variable "node_group_desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
  default     = 2
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "rancher-node-group"
}

variable "node_group_capacity_type" {
  description = "Capacity type for the EKS node group (e.g., ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "172.130.0.0/22"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "rancher-vpc"
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["172.130.0.0/24", "172.130.1.0/24"]
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["172.130.2.0/24", "172.130.3.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
