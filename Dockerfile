#Stage 1 
FROM python:3.12-slim as builder
WORKDIR /app
COPY . /app/
RUN pip3.12 install --no-cache-dir . && chown -R appuser:appuser /app && chmod o-rwx /app -R
ENTRYPOINT [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4" ]