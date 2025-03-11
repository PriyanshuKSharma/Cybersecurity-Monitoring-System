#!/bin/bash
# =================================
# AWS Step Function Trigger Script
# =================================

STATE_MACHINE_ARN="arn:aws:states:us-east-1:376129864728:stateMachine:IncidentResponseWorkflow"
REGION="us-east-1"

# ================================
# Read `input.json` as JSON String
# ================================
INPUT_JSON=$(cat input.json | tr -d '\n' | tr -d '\r')

# ================================
# Trigger Step Function
# ================================
aws stepfunctions start-execution \
    --state-machine-arn "$STATE_MACHINE_ARN" \
    --input "$INPUT_JSON" \
    --region "$REGION"
