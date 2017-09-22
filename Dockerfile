FROM python:3-alpine

RUN apk add --update build-base python-dev py-pip jpeg-dev zlib-dev libffi-dev postgresql-dev
ENV LIBRARY_PATH=/lib:/usr/lib

CMD ["python3"]
