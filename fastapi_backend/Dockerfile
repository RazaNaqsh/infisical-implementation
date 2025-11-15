FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY app/ .

# Run server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
