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