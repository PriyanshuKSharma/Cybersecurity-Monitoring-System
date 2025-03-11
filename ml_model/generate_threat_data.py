import pandas as pd
import random
import time

# Simulated IP Addresses (Expanded for Variety)
IP_ADDRESSES = [
    "192.168.1.1", "203.0.113.5", "198.51.100.7", "10.0.0.3", "172.16.5.8",
    "45.33.32.156", "202.54.1.3", "185.199.108.153", "51.15.37.220", "209.58.178.32",
    "34.201.32.74", "23.94.5.1", "89.187.163.71", "67.205.146.11", "144.202.23.31"
]

# Expanded Attack Patterns with Categorization
PATTERNS = [
    { "pattern": "/etc/passwd", "category": "Data Exfiltration", "severity": "High" },
    { "pattern": "/login", "category": "Brute Force", "severity": "Medium" },
    { "pattern": "sqlmap/1.5", "category": "SQL Injection", "severity": "High" },
    { "pattern": "normal_request", "category": "Normal", "severity": "Low" },
    { "pattern": "nmap_scan", "category": "Reconnaissance", "severity": "Medium" },
    { "pattern": "admin' OR '1'='1", "category": "SQL Injection", "severity": "High" },
    { "pattern": "/wp-login.php", "category": "Brute Force", "severity": "Medium" },
    { "pattern": "/shellshock_exploit", "category": "Exploitation", "severity": "High" }
]

# Simulated Ports (Common Attack Targets)
PORTS = [22, 80, 443, 21, 3389, 3306, 8080, 25]

# Generate Sample Data
def generate_data(rows=1000):
    data = []
    for _ in range(rows):
        ip = random.choice(IP_ADDRESSES)
        port = random.choice(PORTS)
        timestamp = int(time.time()) - random.randint(10000, 50000)
        attack_info = random.choice(PATTERNS)

        # Threat Indicator (1 = Threat, 0 = Normal)
        threat = 1 if attack_info["pattern"] != "normal_request" else 0

        # Add Entry
        data.append({
            "source_ip": ip,
            "port": port,
            "timestamp": timestamp,
            "request_pattern": attack_info["pattern"],
            "category": attack_info["category"],
            "severity": attack_info["severity"],
            "threat": threat
        })
    
    # Create DataFrame and Save to CSV
    df = pd.DataFrame(data)
    df.to_csv('threat_data.csv', index=False)
    print("✅ Sample data generated successfully as `threat_data.csv`.")

if __name__ == "__main__":
    generate_data(1000)  # Generates 1000 sample entries
