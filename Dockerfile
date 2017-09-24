# The base image is python 3 alpine
FROM python:3-alpine

# Install new packages
RUN apk add --update build-base python-dev py-pip jpeg-dev zlib-dev libffi-dev postgresql-dev

# Change LIBRARY_PATH environment variable because of error in building zlib
ENV LIBRARY_PATH=/lib:/usr/lib

# Copied from base image
CMD ["python3"]
