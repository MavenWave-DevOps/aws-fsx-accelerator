# -- Networking/outputs.tf ---
output "vpc_id" {
  value = aws_vpc.fsx_vpc.id
}
output "fsx_primary_subnet_id" {
  value = aws_subnet.fsx_private_subnet[0].id
}

output "fsx_secondary_subnet_id" {
  value = aws_subnet.fsx_private_subnet[1].id
}