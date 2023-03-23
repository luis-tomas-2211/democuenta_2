output "account_id" {
  value = aws_organizations_account.example_account.id
}

output "user_name" {
  value = aws_iam_user.example_user.name
}

output "role_arn" {
  value = aws_iam_role.example_role.arn
}

output "group_name" {
  value = element(tolist(aws_iam_user_group_membership.example_user_group_membership.groups), 0)
}

