# The Containerization process

## Creating a Dockerfile

The application has been stored in a Docker container. The containerization begins by creating a Dockerfile, specifying all of the conditions for the application.
- The base image chosen to run the Flask application is `python:3.8-slim`.
- The working directory is set to `/app`.
- The dockerfile is instructed to copy all of the files from the host into `/app` directory.
- The dockerfile installs the system dependencies and ODBC driver as well as setuptools
- The necessary python packages are installed fromt the `requirements.txt` file using the command `pip install --trusted-host pypi.python.org -r requirements.txt`.
- The port `5000` is exposed so that the application can be accessed through `http://127.0.0.1:5000`. 
- The CMD line runs `app.py` through `python`

## Building the Docker image

Once the Dockerfile has been created, we run the command `docker build -t dockerfile .` to build the Docker image based on the conditions specified in the Dockerfile. 

To test the image has been built correctly, the image is mapped to the exposed port through the command `docker run -p 5000:5000 dockerfile`. Accessing the application through the container on a web browser through the link `http://127.0.0.1:5000`, we see that the application runs as desired.

## Tagging and pushing to Docker Hub

The Docker image is tagged with the command `docker tag dockerfile mujahidur22/orders:v1.0` to maintain the build version of the application.

After tagging, the image is pushed to Docker Hub using `docker push mujahidur22/orders:v1.0` command.

The Docker image is **mujahidur22/orders:v1.0**
