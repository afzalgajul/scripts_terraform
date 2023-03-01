resource "aws_iam_user" "test" {
  name = var.iamuser
}

 resource "aws_iam_role" "iam-role" {
  name = var.iamrole

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_group" "test1" {
  name = var.iamgroup
}
resource "aws_iam_policy" "mypolicy" {
  name        = "mypolicy"
  description = "policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
/*
resource "aws_iam_policy_attachment" "mypolicy" {
  name       = "policy-attachment"
  users      = ["${var.aws_iam_user}"]
  roles      = ["${var.aws_iam_role}"]
  groups     = ["${var.aws_iam_group}"]
  policy_arn = aws_iam_policy.mypolicy.arn
}
*/
