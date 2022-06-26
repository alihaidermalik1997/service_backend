# Dockerfile for Django Applications

# Section 1- Base Image
FROM python:3.10-slim

# Section 2- Python Interpreter Flags
ENV PYTHONUNBUFFERED 1  
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /service_backend


# Section 3- Compiler and OS libraries
RUN apt-get update \  
  && apt-get install -y --no-install-recommends build-essential libpq-dev \  
  && rm -rf /var/lib/apt/lists/*

# Section 4- Project libraries and User Creation
COPY ./service_backend/requirements.txt /service_backend/requirements.txt


RUN pip install -r /service_backend/requirements.txt

# Section 5- Code and User Setup
COPY . /service_backend/
