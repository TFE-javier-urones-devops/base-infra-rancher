output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificado del CA del EKS (base64)"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  description = "Nombre del cluster"
  value       = module.eks.cluster_name
}

output "cluster_id" {
  description = "ID del cluster"
  value       = module.eks.cluster_id
}