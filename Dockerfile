# TODO: Step 1 - Use an official Python runtime as a parent image.
FROM --platform=linux/amd64 public.ecr.aws/docker/library/python:3.9.10-slim-buster

# TODO: Step 2 - Set the working directory in the container
# Set it to /app, a commonly used directory for web applications.
WORKDIR /app

# TODO: Step 3 - Copy the application files in the container
# Copy the contents of your local directory into the container's /app directory.
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


# TODO: Step 4 - Install Python packages specified in requirements.txt
# Assuming your requirements.txt is in the same directory as your Dockerfile.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# TODO: Step 5 - Expose port 5000
EXPOSE 5000

# TODO: Step 6 - Define Startup Command
# Specify the command that should be executed when the container launches.
# This command should run the file that starts the Flask application.
CMD ["python", "app.py"]
