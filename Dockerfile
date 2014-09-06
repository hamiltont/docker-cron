FROM python:2.7
MAINTAINER Hamilton Turner <hamiltont@gmail.com>

# Need hg to download devcron
RUN apt-get update && apt-get install -y mercurial

# Yay devcron
RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

# Setup defaults
RUN mkdir /cron && \
    echo "* * * * * /cron/sample.sh" > /cron/crontab && \
    echo "echo hello world" > /cron/sample.sh && \
    chmod a+x /cron/sample.sh

VOLUME ["/cron"]

CMD ["devcron.py", "/cron/crontab"]
