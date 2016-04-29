FROM drydock/u14:prod
MAINTAINER Matt Snider (matt@cleanenergyexperts.com)

ADD . /u14lm

RUN chown -R ubuntu:ubuntu /u14lm/
RUN /u14lm/install.sh