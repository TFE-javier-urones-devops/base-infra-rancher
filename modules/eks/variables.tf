variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
}

variable "node_group_min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
}

variable "node_group_desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_group_capacity_type" {
  description = "Capacity type for the EKS node group (e.g., ON_DEMAND or SPOT)"
  type        = string
}