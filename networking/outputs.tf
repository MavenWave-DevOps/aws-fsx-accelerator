# -- Networking/outputs.tf ---
output "vpc_id" {
  value = aws_vpc.fsx_vpc.id
}