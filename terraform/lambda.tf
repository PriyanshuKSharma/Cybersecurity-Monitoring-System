resource "aws_lambda_function" "data_collector" {
  function_name = "DataCollector"
  handler       = "data_collector.lambda_handler"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../data_collection/data_collector.zip"
  timeout       = 30
  memory_size   = 256
}

resource "aws_lambda_function" "threat_detector" {
  function_name = "ThreatDetector"
  handler       = "threat_detector.lambda_handler"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../data_collection/threat_detector.zip"
  timeout       = 30
  memory_size   = 256
}
