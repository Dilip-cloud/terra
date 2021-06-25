output "pub_sub_id" {
    value = aws_subnet.public.id
}

output "pvt_sub_id" {
    value = aws_subnet.private1.id
}