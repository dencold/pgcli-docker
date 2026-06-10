FROM python:3.14-trixie
RUN apt-get -y update && apt-get -y install libpq-dev build-essential less
RUN pip install pgcli==4.5.0
ADD run-pgcli.sh /bin/run-pgcli.sh
ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]
