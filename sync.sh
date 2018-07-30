#!/bin/sh

# Ensure all of the ENV VARs are set
if [ -z "$INTERVAL" ]; then
	echo "INTERVAL env var is not set" && exit 1
fi

if [ -z "$SOURCE_BUCKET" ]; then
	echo "SOURCE_BUCKET env var is not set" && exit 1
fi

if [ -z "$DESTINATION_BUCKET" ]; then
	echo "DESTINATION_BUCKET env var is not set" && exit 1
fi

if [ -z "$AWS_DEFAULT_REGION" ]; then
	echo "AWS_DEFAULT_REGION env var is not set" && exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
	echo "AWS_ACCESS_KEY_ID env var is not set" && exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
	echo "AWS_SECRET_ACCESS_KEY env var is not set" && exit 1
fi

# Sync objects between the source and destination buckets, then sleep
while true; do
    aws s3 sync s3://${SOURCE_BUCKET} s3://${DESTINATION_BUCKET} --delete
    echo "========== Sleeping for $INTERVAL seconds =========="
    sleep ${INTERVAL}s
done