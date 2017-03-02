FROM python:2.7.10-slim
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>
RUN apt-get -y update && apt-get -y install libpq-dev build-essential
RUN pip install pgcli==1.4.0
ADD run-pgcli.sh /bin/run-pgcli.sh
ENTRYPOINT ["run-pgcli.sh"]

