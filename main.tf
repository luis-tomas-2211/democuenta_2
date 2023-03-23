# Crear una cuenta en AWS Organizations
resource "aws_organizations_account" "example_account" {
  name     = "${var.accountName}"
  email    = "${var.SSOEmail}"
  role_name = "AWSControlTowerExecution"
  parent_id = "${var.managedOrganizationalUnit}"
}

# Crear un usuario en IAM para acceder a la cuenta
resource "aws_iam_user" "example_user" {
  name = "${var.SSOUserFirstName}_${var.SSOUserLastName}"
}

# Crear un rol en IAM y asignarlo al usuario
resource "aws_iam_role" "example_role" {
  name = "${var.SSOUserFirstName}_${var.SSOUserLastName}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${aws_organizations_account.example_account.id}:root"
        }
      }
    ]
  })
}

# Asociar el rol al usuario
resource "aws_iam_user_policy_attachment" "example_role_policy_attachment" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_role.example_role.arn
}

# Asignar el usuario a un grupo en IAM
resource "aws_iam_user_group_membership" "example_user_group_membership" {
  groups = ["example-group"]
  user   = aws_iam_user.example_user.name
}
