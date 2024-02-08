output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnets_ids" {
  value = aws_subnet.subnets.*.id
}