output "user_id_names" {
    value = {for user in aws_iam_user.user: user.name => user.id} 
}