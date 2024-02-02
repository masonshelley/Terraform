# Define the EventBridge rule
resource "aws_cloudwatch_event_rule" "rotate_credentials_rule" {
  name                = "RotateCredentialsEvery60Days"
  description         = "Rule to rotate user credentials in Systems Manager (SSM) every 60 days"
  schedule_expression = "cron(0 0 * /60 * *)" # Cron expression for every 60 days

  tags = {
    Name = "RotateCredentialsRule"
  }
}

# Define the target for the EventBridge rule (the Lambda function)
resource "aws_cloudwatch_event_target" "rotate_credentials_target" {
  rule      = aws_cloudwatch_event_rule.rotate_credentials_rule.name
  target_id = "RotateCredentialsLambdaTarget"
  arn       = aws_lambda_function.rotate_credentials_function.arn
}
