FROM python:3.5
MAINTAINER Tinpee <tinpee.dev@gmail.com>

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip \
    && pip install flask gunicorn

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /src/db

CMD ["/entrypoint.sh"]

CMD gunicorn --bind 0.0.0.0:$PORT flash_cards:app
