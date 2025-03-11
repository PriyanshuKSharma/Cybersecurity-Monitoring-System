import json

THREAT_PATTERNS = ["nmap", "sqlmap", "bruteforce"]

def lambda_handler(event, context):
    new_threats = event.get('new_threats', [])
    for threat in new_threats:
        if threat not in THREAT_PATTERNS:
            THREAT_PATTERNS.append(threat)

    return {
        "status": "Threat Patterns Updated",
        "threat_patterns": THREAT_PATTERNS
    }
