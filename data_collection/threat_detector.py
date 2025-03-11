import json

THREAT_PATTERNS = ["nmap", "sqlmap", "bruteforce", "/etc/passwd"]

def lambda_handler(event, context):
    logs = event.get('logs', [])
    detected_threats = []

    for log in logs:
        for pattern in THREAT_PATTERNS:
            if pattern in log.get('activity', '').lower():
                detected_threats.append(log)

    return {
        "status": "Threat Detected" if detected_threats else "No Threats Found",
        "threats": detected_threats
    }
