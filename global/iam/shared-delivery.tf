# The Delivery group is responsible for building, testing, and deploying infra and applications.

# The model here is that each team will get its own IAM principals for delivery.
# Teams could be: devops and each project.
# Separate principals will enable teams to use the most appropriate CI/CD solutions
# while minimizing risks of lost keys and enabling finer-grained resource policies
# and permissions boundaries.  Or that's the idea anyway.

resource "aws_iam_user" "delivery-devops" {
  name = "delivery-devops"
  path = "/services/"
}

resource "aws_iam_group" "delivery" {
  name = "delivery"
  path = "/services/"
}

resource "aws_iam_group_policy_attachment" "delivery-Admin" {
  group      = aws_iam_group.delivery.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "delivery" {
  name = "delivery-membership"

  users = [
    aws_iam_user.delivery-devops.name,
    aws_iam_user.delivery-introductions-bot.name,
  ]

  group = aws_iam_group.delivery.name
}

resource "aws_iam_policy_attachment" "delivery" {
  name = "delivery-membership"
  roles = [
    aws_iam_role.delivery-introductions-bot.arn
  ]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
