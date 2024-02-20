#Use an official Python runtime as a parent image. 
FROM --platform=linux/amd64 python:3.8-slim

#Set the working directory in the container
WORKDIR /app

#Copy the application files in the container
COPY . /app

# Install system dependencies and ODBC driver
RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \  
    apt-get clean

# Install pip and setuptools
RUN pip install --upgrade pip setuptools

#Install Python packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose port 
EXPOSE 5001

# Define Startup Command
CMD ["python", "app.py"]
