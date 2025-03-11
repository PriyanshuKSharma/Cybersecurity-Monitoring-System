@echo off
REM ================================
REM AWS Step Function Trigger Script
REM ================================

SET STATE_MACHINE_ARN=arn:aws:states:us-east-1:376129864728:stateMachine:IncidentResponseWorkflow
SET REGION=us-east-1

REM ================================
REM Read JSON Input as Single Line
REM ================================
FOR /F "delims=" %%A IN ('powershell -Command "Get-Content input.json -Raw | Out-String | ForEach-Object {$_ -replace '\s',''}"') DO (
    SET INPUT_JSON=%%A
)

REM ================================
REM Trigger Step Function
REM ================================
aws stepfunctions start-execution --state-machine-arn %STATE_MACHINE_ARN%  --input "%INPUT_JSON%"  --region %REGION%

PAUSE
