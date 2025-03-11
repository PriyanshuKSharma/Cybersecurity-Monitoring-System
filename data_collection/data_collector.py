import boto3
import json
from datetime import datetime

client = boto3.client('logs')

def lambda_handler(event, context):
    log_data = {
        "timestamp": str(datetime.now()),
        "source_ip": event.get('source_ip', 'Unknown'),
        "user_agent": event.get('user_agent', 'Unknown'),
        "activity": event.get('activity', 'Unknown')
    }

    client.put_log_events(
        logGroupName='/aws/lambda/security_monitoring',
        logStreamName='DataCollection',
        logEvents=[
            {
                'timestamp': int(datetime.now().timestamp() * 1000),
                'message': json.dumps(log_data)
            }
        ]
    )

    return {"status": "Data Collected", "data": log_data}
