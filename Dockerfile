FROM java:8
MAINTAINER Shawn Dempsay <shawn@dempsay.org>


RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get -y upgrade && apt-get -y install curl wget supervisor

RUN useradd -r elasticsearch

# Install elasticsearch

WORKDIR /opt
RUN wget --no-check-certificate -O- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-2.1.1.tar.gz | tar xvfz -
RUN mv elasticsearch-2.1.1 elasticsearch
RUN mkdir -p /opt/elasticsearch/data
RUN chown -R elasticsearch /opt/elasticsearch

# Install elastic HQ
RUN cd elasticsearch && bin/plugin install royrusso/elasticsearch-HQ/2.0

ENV ES_CLUSTER_NAME elasticsearch
ENV ES_SCRIPTING false

EXPOSE 9200 9300
VOLUME /opt/elasticsearch/data

ADD startElasticsearch /opt
RUN chmod +x /opt/startElasticsearch
CMD /opt/startElasticsearch
