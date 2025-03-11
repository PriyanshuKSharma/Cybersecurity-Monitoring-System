### 📄 **README.md — Cybersecurity Monitoring System**  

# 🛡️ **Cybersecurity Monitoring System**  
An automated system designed to detect, analyze, and mitigate cyber threats in real-time using **AWS Step Functions**, **Lambda**, **Machine Learning**, and **CloudWatch**.  

This system leverages:  
✅ **Malware Simulations** for attack testing  
✅ **ML Model Integration** for proactive threat prediction  
✅ **Threat Detection Workflow** with AWS Step Functions  
✅ **PDF Reporting** for detailed security insights  

---

## 🚀 **Overview**  
This project offers a robust framework for:  
✅ **Simulating Malware Attacks** like SQL Injection, Brute Force, Ransomware, and XSS  
✅ **ML Model-Driven Threat Prediction** for proactive security  
✅ **Generating Weekly Reports** with insights on detected threats  
✅ **Monitoring CloudWatch Logs** for real-time analysis  
✅ **Automating AWS Infrastructure Deployment** using Terraform  

---

## 🏗️ **Project Structure**  
```
📂 Cybersecurity-Monitoring-System
│
├── 📂 data_collection
│   ├── 🐍 data_collector.py          # Lambda for data collection
│   ├── 🐍 threat_detector.py         # Lambda for threat detection
│   ├── 🐍 adaptive_learning.py       # Adaptive learning logic for dynamic threat detection
│
├── 📂 ml_model
│   ├── 🐍 train_model.py             # ML model training for proactive threat prediction
│   ├── 🐍 predict.py                 # Predictive model for identifying cyber threats
│   ├── 📄 model.pkl                  # Trained ML model for predictions
│
├── 📂 malware_simulation
│   ├── 🐍 malware_sql_injection.py   # SQL Injection simulation
│   ├── 🐍 malware_brute_force.py     # Brute Force attack simulation
│   ├── 🐍 malware_ransomware.py      # Ransomware attack simulation
│   ├── 🐍 malware_xss.py             # XSS attack simulation
│
├── 📂 reports
│   ├── 🐍 generate_report.py         # Report generation script
│   ├── 📄 weekly_report.pdf          # Sample PDF report with threat details
│
├── 📂 event_trigger
│   ├── 📝 aws_automation.sh          # Master Bash script for AWS CLI automation
│   ├── 📝 input.json                 # Input file for threat data testing
│
├── 📂 step_functions
│   ├── 📄 step_function_definition.asl.json  # Step Function definition for workflow automation
│   ├── 📄 step_functions.tf                   # Terraform code for Step Function deployment
│
├── 📂 terraform
│   ├── 📄 main.tf                   # Main Terraform configuration
│   ├── 📄 variables.tf              # Variable definitions for deployment
│   ├── 📄 outputs.tf                # Outputs from deployed resources
│   ├── 📄 provider.tf               # AWS provider configuration
│   ├── 📄 terraform.tfvars          # Configuration variables for AWS resources
│
├── 📂 .github
│   └── 📂 workflows
│       └── 📝 deploy.yaml            # CI/CD Pipeline for automated deployment
│
├── 📄 README.md                      # Project documentation
```

---

## ⚙️ **Prerequisites**  
Before starting, ensure you have:  
✅ **AWS CLI** installed and configured  
✅ **Terraform** for infrastructure deployment  
✅ **Git Bash**, **WSL**, or any Bash environment for running `.sh` scripts  
✅ **Python 3.x** with the following packages:  
```
boto3
pandas
scikit-learn
joblib
fpdf
cryptography
```

---

## 🔹 **Installation Steps**  

### 🔹 **Step 1: Clone the Repository**
```bash
git clone <repository-url>
cd Cybersecurity-Monitoring-System
```

---

### 🔹 **Step 2: Deploy Infrastructure Using Terraform**
1️⃣ Navigate to the Terraform directory:  
```bash
cd terraform
```

2️⃣ Initialize Terraform:  
```bash
terraform init
```

3️⃣ Deploy resources:  
```bash
terraform apply
```

✅ Resources created:  
- Lambda Functions  
- Step Function  
- CloudWatch Log Groups  

---

### 🔹 **Step 3: Simulate Malware Attacks**
1️⃣ Navigate to the **event_trigger** folder:  
```bash
cd ../event_trigger
```

2️⃣ Run the enhanced script:  
```bash
./aws_automation.sh
```

3️⃣ Select **Option 6** to initiate a malware attack simulation.  

✅ Select one of the following:  
- **1)** SQL Injection  
- **2)** Brute Force Attack  
- **3)** Ransomware  
- **4)** XSS Attack  

---

### 🔹 **Step 4: Use the ML Model for Threat Prediction**
1️⃣ Navigate to the **ml_model** folder:  
```bash
cd ../ml_model
```

2️⃣ Train the ML model using `train_model.py`:  
```bash
python3 train_model.py
```

3️⃣ Use the `predict.py` script to predict threats from new data:  
```bash
python3 predict.py
```

✅ Sample Output:  
```
Prediction: [Threat Detected]
```

---

### 🔹 **Step 5: Generate Security Reports**
To create a PDF report summarizing detected threats:  

✅ Select **Option 7** from the menu.  
✅ The report will be generated in the `/reports` folder as **`weekly_report.pdf`**.

---

### 🔹 **Step 6: Monitor CloudWatch Logs**
To view detailed logs:  

✅ Select **Option 5** from the menu  
✅ Choose the Lambda function for log retrieval  

---

## 🔎 **Key Features**
✅ **Machine Learning Integration:** Predicts threats using trained ML models  
✅ **Real-Time Threat Detection:** Uses Step Functions and Lambda for live monitoring  
✅ **Malware Simulation:** Safely tests your system against simulated attacks  
✅ **Adaptive Learning Module:** Learns from threat patterns for improved detection  
✅ **Comprehensive PDF Reports:** Generates detailed weekly security insights  
✅ **Automated Infrastructure Deployment:** Powered by **Terraform**  

---

## 🛡️ **Use Case Scenarios**
| **Scenario**                 | **Feature Used**                  |
|------------------------------|-----------------------------------|
| ✅ **SQL Injection Attempt**    | `malware_sql_injection.py`         |
| ✅ **Brute Force Login Attack** | `malware_brute_force.py`           |
| ✅ **Ransomware Simulation**    | `malware_ransomware.py`            |
| ✅ **Cross-Site Scripting (XSS)**| `malware_xss.py`                   |
| ✅ **Weekly Threat Analysis Report**| `generate_report.py`             |
| ✅ **ML-Driven Threat Prediction**| `train_model.py` & `predict.py`    |

---

## 🔹 **Future Improvements**
🔹 Add **CloudWatch Alarms** for proactive alerting  
🔹 Integrate **Amazon SNS** for instant notifications on detected threats  
🔹 Improve ML models for **anomaly detection** in real-time data flow  
🔹 Introduce **Auto-Healing Mechanisms** for faster recovery from attacks  

---

## 📄 **License**
This repository is intended for **educational and learning purposes only**.  

---

## 📞 **Contact**
For queries, collaboration, or improvement suggestions:  
📧 **priyanshu17ks@gmail.com**  
🔗 [GitHub Profile](https://github.com/PriyanshuKSharma)  

---

## 🚀 **Happy Threat Hunting!** 😊

**NOTE: The work is not done yet, there is a lot of scope of improvement.**