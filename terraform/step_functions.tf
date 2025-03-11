resource "aws_sfn_state_machine" "incident_response_workflow" {
  name     = "IncidentResponseWorkflow"
  role_arn = aws_iam_role.lambda_role.arn
  definition = templatefile("${path.module}/step_function_definition.asl.json", {
    data_collector_arn  = data.aws_lambda_function.data_collector.arn
    threat_detector_arn = data.aws_lambda_function.threat_detector.arn
  })
}
