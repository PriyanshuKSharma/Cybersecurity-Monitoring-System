import joblib
import json

model = joblib.load('model.pkl')

def lambda_handler(event, context):
    data = event.get('data', [])
    
    predictions = model.predict(data)
    threat_detected = any(predictions)

    return {
        "status": "Threat Detected" if threat_detected else "No Threats Found",
        "predictions": predictions.tolist()
    }
