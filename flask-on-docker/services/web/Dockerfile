# syntax=docker/dockerfile:1

FROM python:3.9.5-slim-buster 

# maintainer
MAINTAINER cjlc2018 'cjlc2018@service.me'

# update environment and install pip
RUN apt-get update -y && apt-get install -y python-pip python-dev

# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get install -y netcat

# require dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip --no-cache install -r requirements.txt

# copy project
COPY . /usr/src/app/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
