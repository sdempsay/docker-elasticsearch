FROM stackbrew/ubuntu:saucy
MAINTAINER Luis Arias <luis@balsamiq.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget openjdk-7-jre-headless

# Install elasticsearch

WORKDIR /opt
RUN wget --no-check-certificate -O- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz | tar xvfz -
RUN mv elasticsearch-1.0.1 elasticsearch

# Install elasticsearch cloud aws plugin

RUN cd elasticsearch && bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.0.0

ENV ES_CLUSTER_NAME elasticsearch
ENV ES_AWS_REGION us-east-1

EXPOSE 9200 9300

ADD run /opt/run
RUN chmod +x /opt/run
CMD ./run