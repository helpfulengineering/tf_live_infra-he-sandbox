# Define the O2 monitoring project's principals in sandbox.

# IAM user for CI/CD
resource "aws_iam_user" "delivery-monitoring-O2" {
  name = "delivery-monitoring-O2"
  path = "/services/"
}

# Service role for the application to run as
resource "aws_iam_role" "monitoring-O2" {
  name = "svc-monitoring-O2"
  path = "/services/"
  assume_role_policy = file("${path.module}/templates/assume_role_policy/ec2.json")
}

resource "aws_iam_role_policy_attachment" "monitoring-O2" {
  role =  aws_iam_role.monitoring-O2.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUser"
}