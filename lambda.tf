# Define the Lambda function
resource "aws_lambda_function" "rotate_credentials_function" {
  function_name = "RotateCredentialsFunction"
  handler       = "rotate_credentials.rotate_credentials"
  runtime       = "python3.8"
  filename      = "rotate_credentials.zip" # Assuming your code is in a zip file
  role          = aws_iam_role.lambda_role.arn

  environment {
    variables = {
      # Add any environment variables needed by your Lambda function
    }
  }
}

# Define IAM role for Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "RotateCredentialsLambdaRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  # Attach policy for Lambda to execute commands in Systems Manager
  # Adjust permissions as needed based on your specific requirements
  # This policy grants broad permissions for demonstration purposes; please refine for production use
  inline_policy {
    name = "lambda_policy"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ssm:SendCommand",
      "Resource": "*"
    }
  ]
}
EOF
  }
}
