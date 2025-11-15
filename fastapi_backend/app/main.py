# app/main.py
from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def home():
    service_name = os.getenv("SERVICE_NAME", "DefaultService")
    api_key = os.getenv("API_KEY", "NoKeyFound")
    return {
        "service_name": service_name,
        "api_key": api_key
    }
