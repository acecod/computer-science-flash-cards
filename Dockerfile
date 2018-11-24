FROM python:3.5
MAINTAINER Tinpee <tinpee.dev@gmail.com>

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip \
    && pip install flask gunicorn

VOLUME /src/db

COPY cards-empty.db /src/db/cards.db

CMD gunicorn --bind 0.0.0.0:$PORT flash_cards:app
