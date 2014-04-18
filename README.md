docker-elasticsearch
====================

Elasticsearch master node with optional ec2 discovery

The following environment variables can be used to configure the container:

    ES_CLUSTER_NAME     The name of the elasticsearch cluster, default is "elasticsearch".  This is also
                        the ec2 group name that is used for discovery.
    ES_DISCOVERY        The type of discovery to use with elasticsearch, if not set will use multicast. Setting to "ec2"
    										will enable ec2 discovery using ES_CLUSTER_NAME in ES_AWS_REGION.
    ES_BUCKET						If set and ec2 discovery is enabled then elasticsearch will be configured to use the given bucket name
                        as the s3 gateway
    ES_AWS_REGION       The aws region to be used for discovery, default is "us-east-1".

To build:

    docker build -t balsamiq/docker-elasticsearch .

To run locally:

		docker balsamiq/docker-elasticsearch

To run on ec2:

		docker -e ES_DISCOVERY=ec2 balsamiq/docker-elasticsearch
