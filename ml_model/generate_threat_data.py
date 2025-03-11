import pandas as pd
import random
import time

# Simulated IP Addresses
IP_ADDRESSES = [
    "192.168.1.1", "203.0.113.5", "198.51.100.7", "10.0.0.3", "172.16.5.8",
    "45.33.32.156", "202.54.1.3", "185.199.108.153", "51.15.37.220", "209.58.178.32"
]

# Simulated Attack Patterns
PATTERNS = [
    "/etc/passwd",  # Data Exfiltration
    "/login",        # Brute Force
    "sqlmap/1.5",    # SQL Injection
    "normal_request", # Normal Activity
    "nmap_scan",      # Nmap Recon
    "admin' OR '1'='1",  # SQL Injection Payload
]

# Simulated Ports (Common attack targets)
PORTS = [22, 80, 443, 21, 3389]

# Generate Sample Data
def generate_data(rows=500):
    data = []
    for _ in range(rows):
        ip = random.choice(IP_ADDRESSES)
        port = random.choice(PORTS)
        timestamp = int(time.time()) - random.randint(10000, 50000)
        pattern = random.choice(PATTERNS)
        threat = 1 if pattern in ["/etc/passwd", "sqlmap/1.5", "admin' OR '1'='1", "nmap_scan"] else 0

        data.append({
            "source_ip": ip,
            "port": port,
            "timestamp": timestamp,
            "request_pattern": pattern,
            "threat": threat
        })
    
    df = pd.DataFrame(data)
    df.to_csv('threat_data.csv', index=False)
    print("✅ Sample data generated successfully as `threat_data.csv`.")

if __name__ == "__main__":
    generate_data(500)  # Generates 500 sample entries
