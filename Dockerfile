FROM mongo

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install awscli

ENV CRON_TIME="0 3 * * *" \
  TZ=US/Eastern \
  CRON_TZ=US/Eastern

ADD run.sh /run.sh
CMD /run.sh
