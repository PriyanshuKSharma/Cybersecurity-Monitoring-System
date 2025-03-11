#!/bin/bash
# ============================================
# 🔒 AWS Cybersecurity Monitoring Automation
# ============================================

# AWS Configuration
REGION="us-east-1"
STATE_MACHINE_ARN="arn:aws:states:us-east-1:376129864728:stateMachine:IncidentResponseWorkflow"
LAMBDA_LOG_GROUP_1="/aws/lambda/PriyanshuKSharma-2-9d98bea"
LAMBDA_LOG_GROUP_2="/aws/lambda/additionLambda-3-ccfdbb5"

# ============================================
# Function: Trigger Step Function
# ============================================
trigger_step_function() {
    INPUT_JSON=$(cat input.json | tr -d '\r\n')

    aws stepfunctions start-execution \
        --state-machine-arn "$STATE_MACHINE_ARN" \
        --input "$INPUT_JSON" \
        --region "$REGION"
}

# ============================================
# Function: Check Step Function Execution Status
# ============================================
check_execution_status() {
    read -p "Enter Execution ARN: " EXECUTION_ARN
    aws stepfunctions describe-execution \
        --execution-arn "$EXECUTION_ARN" \
        --region "$REGION"
}

# ============================================
# Function: List Lambda Functions
# ============================================
list_lambda_functions() {
    aws lambda list-functions --region "$REGION"
}

# ============================================
# Function: List Step Functions
# ============================================
list_step_functions() {
    aws stepfunctions list-state-machines --region "$REGION"
}

# ============================================
# Function: Check CloudWatch Logs for Lambda
# ============================================
check_logs() {
    echo "1) PriyanshuKSharma-2-9d98bea"
    echo "2) additionLambda-3-ccfdbb5"
    read -p "Select Lambda Log Group (1/2): " CHOICE

    if [ "$CHOICE" == "1" ]; then
        LOG_GROUP="$LAMBDA_LOG_GROUP_1"
    else
        LOG_GROUP="$LAMBDA_LOG_GROUP_2"
    fi

    aws logs get-log-events \
        --log-group-name "$LOG_GROUP" \
        --log-stream-name "$(aws logs describe-log-streams --log-group-name "$LOG_GROUP" --region "$REGION" --query 'logStreams[0].logStreamName' --output text)" \
        --region "$REGION"
}

# ============================================
# Function: Simulate Malware Attacks
# ============================================
simulate_malware_attack() {
    echo "Select a Malware Attack Type:"
    echo "1) SQL Injection"
    echo "2) Brute Force Attack"
    echo "3) Ransomware"
    echo "4) XSS Attack"
    read -p "Choose an option (1-4): " ATTACK_TYPE

    case $ATTACK_TYPE in
        1) python ../malware_simulation/malware_sql_injection.py ;;
        2) python /malware_simulation/malware_ransomware.py ;;
        3) python ../malware_simulation/malware_ransomware.py ;;
        4) python ../malware_simulation/malware_xss.py ;;
        *) echo "❌ Invalid Choice. Exiting..." ;;
    esac
}

# ============================================
# Function: Generate Threat Report
# ============================================
generate_report() {
    python3 ../reports/generate_report.py
    echo "✅ Report Generated: ../reports/weekly_report.pdf"
}

# ============================================
# Menu: Main Interface
# ============================================
while true; do
    echo -e "\n🔹 AWS Cybersecurity Automation Menu 🔹"
    echo "1) Trigger Step Function"
    echo "2) Check Step Function Execution Status"
    echo "3) List Lambda Functions"
    echo "4) List Step Functions"
    echo "5) Check CloudWatch Logs"
    echo "6) Simulate Malware Attack"
    echo "7) Generate Threat Report"
    echo "8) Exit"

    read -p "Select an option (1-8): " OPTION

    case $OPTION in
        1) trigger_step_function ;;
        2) check_execution_status ;;
        3) list_lambda_functions ;;
        4) list_step_functions ;;
        5) check_logs ;;
        6) simulate_malware_attack ;;
        7) generate_report ;;
        8) echo "✅ Exiting..."; exit 0 ;;
        *) echo "❌ Invalid Option. Please try again." ;;
    esac
done
