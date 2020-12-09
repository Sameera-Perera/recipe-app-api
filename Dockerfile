FROM python:3.7-alpine
MAINTAINER Sameera Perera

ENV PYTHONUNBUFFERED 1

COPY ./requirments.txt /requirments.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tem-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirments.txt
RUN apk del .tem-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
