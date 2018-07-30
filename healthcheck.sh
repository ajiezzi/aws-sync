#!/bin/sh

# Execute dryrun to determine health of the aws sync command
aws s3 sync s3://${SOURCE_BUCKET} s3://${DESTINATION_BUCKET} --delete --dryrun || exit 1