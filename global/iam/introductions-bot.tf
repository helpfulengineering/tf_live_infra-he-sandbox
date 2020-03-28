# Define the introuction bot project's principals in sandbox.

resource "aws_iam_user" "delivery-introductions-bot" {
  name = "delivery-introductions-bot"
  path = "/services/"
}

