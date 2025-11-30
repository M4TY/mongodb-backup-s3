FROM mongo

RUN apt-get update && apt-get install -y curl unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

ENV CRON_TIME="0 3 * * *" \
    TZ=US/Eastern \
    CRON_TZ=US/Eastern

ADD run.sh /run.sh
CMD /run.sh
