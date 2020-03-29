# Define the introuction bot project's principals in sandbox.

resource "aws_iam_user" "delivery-introductions-bot" {
  name = "delivery-introductions-bot"
  path = "/services/"
}

# introduction bot plans to use CodeBuild; make the delivery role assumable

resource "aws_iam_role" "delivery-introductions-bot" {
  name = "delivery-introductions-bot"
  path = "/services/"
  assume_role_policy = file("${path.module}/templates/assume_role_policy/codebuild.json")
}

resource "aws_iam_role_policy_attachment" "delivery-introductions-bot" {
  role =  aws_iam_role.delivery-introductions-bot.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}