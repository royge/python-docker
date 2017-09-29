# The base image is python 3 alpine
FROM python:3-alpine

# Author: Roy Evangelista
MAINTAINER Roy Evangelista <royevangelista@gmail.com>

# Install new packages
RUN apk add --update build-base python-dev py-pip jpeg-dev zlib-dev

# Change LIBRARY_PATH environment variable because of error in building zlib
ENV LIBRARY_PATH=/lib:/usr/lib

# Install ansible
RUN pip install ansible==2.3.2.0

# Copied from base image
CMD ["python3"]
