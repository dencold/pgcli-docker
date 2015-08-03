FROM python:2.7-slim
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>
RUN apt-get -y update && apt-get -y install libpq-dev build-essential
RUN pip install pgcli

ENTRYPOINT ["pgcli"]

