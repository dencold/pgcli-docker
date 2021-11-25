FROM python:3.7.0-slim
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>
RUN apt-get -y update && apt-get -y install libpq-dev build-essential less
RUN pip install pgcli==3.2.0
ADD run-pgcli.sh /bin/run-pgcli.sh
ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]

