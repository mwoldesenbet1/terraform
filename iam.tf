#create IAM users
resource "aws_iam_user" "terra-user1" {
  provider = aws.dev
  name = "terra-user1"
}

resource "aws_iam_user" "terra-user2" {
  provider = aws.dev
  name = "terra-user2"
}

# Define IAM policies
data "aws_iam_policy_document" "terra-policy1" {
  provider = aws.dev
  statement {
    actions   = ["s3:GetObject"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "terra-policy2" {
  provider = aws.dev
  statement {
    actions   = ["ec2:DescribeInstances"]
    resources = ["*"]
  }
}

# Create IAM policies from the policy documents
resource "aws_iam_policy" "terra-policy1" {
  provider = aws.dev
  name   = "terra-policy1"
  policy = data.aws_iam_policy_document.terra-policy1.json
}

resource "aws_iam_policy" "terra-policy2" {
  provider = aws.dev
  name   = "terra-policy2"
  policy = data.aws_iam_policy_document.terra-policy2.json
}

# Attach policies to IAM users
resource "aws_iam_user_policy_attachment" "attach_terra-policy1_to_terra-user1" {
  provider = aws.dev
  user       = aws_iam_user.terra-user1.name
  policy_arn = aws_iam_policy.terra-policy1.arn
}

resource "aws_iam_user_policy_attachment" "attach_terra-policy2_to_terra-user2" {
  provider = aws.dev
  user       = aws_iam_user.terra-user2.name
  policy_arn = aws_iam_policy.terra-policy2.arn
}