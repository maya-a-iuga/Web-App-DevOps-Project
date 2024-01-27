# Containerization Process Documentation

## Overview

This documentation outlines the process of containerizing the web application using Docker. The containerization process involves creating a Docker image that encapsulates the application and its dependencies, making it easy to deploy consistently across different environments.

## Dockerfile

The Dockerfile defines the instructions for building the Docker image. Here are the key steps taken in the Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image.
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

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

# Install Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Expose port
EXPOSE 5000

# Define Startup Command using entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
```

## Docker Commands

### Building the Docker Image

```bash
docker build -t myflaskapp .
```

This command builds a Docker image named `myflaskapp` from the current directory (`.`) containing the Dockerfile and the application files.

### Running a Container

```bash
docker run -p 5000:5000 myflaskapp
```

This command runs a Docker container based on the `myflaskapp` image, mapping port 5000 from the host to port 5000 in the container.

### Tagging and Pushing to Docker Hub

```bash
docker tag myflaskapp username/myflaskapp:latest
docker push username/myflaskapp:latest
```

Replace `username` with your Docker Hub username. These commands tag the image and push it to Docker Hub for distribution.

## Image Information

- **Image Name:** myflaskapp
- **Tags:** latest
- **Instructions for Use:** Run the container with the `docker run` command, mapping the necessary ports. Make sure to replace environment-specific values if needed.

This documentation provides a step-by-step guide for containerizing the web application using Docker. It includes the Dockerfile, commands used, and essential information about the Docker image.