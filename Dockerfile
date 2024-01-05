# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install ODBC Driver for SQL Server
# Note: The commands below might need adjustment based on your specific environment
RUN apt-get update && apt-get install -y --no-install-recommends unixodbc unixodbc-dev wget gnupg

# Download and install the Microsoft ODBC Driver for SQL Server
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql18

# Set environment variables for ODBC Driver
ENV ODBCINI /etc/odbc.ini
ENV ODBCSYSINI /etc
ENV ODBC_DRIVER_ODBC_VER=03.52

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
