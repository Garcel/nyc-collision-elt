FROM python:3.12.0b2-alpine3.18
LABEL authors="garcel"

ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache git

# Create a group and a non root user
RUN addgroup -g 1000 -S nyc && adduser -u 1000 -S nyc -G nyc

# Copy requirements
COPY requirements.txt /

# Install dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r /requirements.txt

# Copy the code
WORKDIR /app
COPY . /app

RUN chmod 777 /app

USER nyc
