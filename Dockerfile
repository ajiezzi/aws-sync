#
# Docker image used to sync data between two AWS S3 buckets.
# 
# Example docker run:
# docker run --rm -e INTERVAL='10' -e SOURCE='test' -e DESTINATION='test2' \
#  -e AWS_DEFAULT_REGION='us-east-1' -e AWS_ACCESS_KEY_ID='xxxx' \
#  -e AWS_SECRET_ACCESS_KEY='xxx'

FROM centos:7
MAINTAINER Adam Iezzi <aiezzi@blacksky.com>

# Default Environment Variables
ENV AWS_DEFAULT_REGION="us-east-1"
ENV INTERVAL=10
ENV SYNC_HOME="/s3sync"

# Install AWS CLI
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install awscli

WORKDIR ${SYNC_HOME}

# Copy the scripts into the working directory
COPY ./*.sh ${SYNC_HOME}/

CMD ./sync.sh