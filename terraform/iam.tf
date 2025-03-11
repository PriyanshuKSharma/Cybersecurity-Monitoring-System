# -------------------------------- IAM ROLE FOR LAMBDA -------------------------------- #
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role-1b"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "states.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    Name        = "LambdaExecutionRole"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

# --------------------------- POLICY FOR CLOUDWATCH LOGGING --------------------------- #
resource "aws_iam_policy" "lambda_logging_policy" {
  name        = "lambda_logging_policy"
  description = "Allows Lambda to log to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

# -------------------------- POLICY FOR STEP FUNCTIONS EXECUTION ---------------------- #
resource "aws_iam_policy" "step_functions_execution_policy" {
  name        = "step_functions_execution_policy"
  description = "Allows Lambda to invoke Step Functions"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "states:StartExecution",
          "states:DescribeExecution",
          "states:StopExecution"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:states:*:*:stateMachine:*"
      }
    ]
  })
}

# --------------------------- POLICY FOR AWS X-RAY TRACING ---------------------------- #
resource "aws_iam_policy" "xray_tracing_policy" {
  name        = "xray_tracing_policy"
  description = "Allows Lambda to send trace data to AWS X-Ray"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# ---------------------- ATTACH POLICIES TO LAMBDA ROLE ---------------------- #
resource "aws_iam_role_policy_attachment" "lambda_logs_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_logging_policy.arn
}

resource "aws_iam_role_policy_attachment" "step_functions_execution_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.step_functions_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "xray_tracing_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.xray_tracing_policy.arn
}
