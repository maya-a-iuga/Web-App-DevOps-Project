FROM python:3.8-slim

# WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

# CMD ["python3", "app.py"]

ENTRYPOINT ["python", "app.py"]
