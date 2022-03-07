#!/bin/bash
set -e

if [ "$S3_DEBUG" -ne 0 ]; then
    DEBUG="--debug"
fi

if [ -n "$S3_URL" ] && [ -n "$S3_KEY" ] && [ -n "$S3_SECRET" ]; then
    mc $DEBUG --config-dir $CONFIG_DIR alias set s3 $S3_URL $S3_KEY $S3_SECRET --api $S3_PROTO
else
    echo "Please set S3_URL, S3_KEY and S3_SECRET"
fi

exec "$@"
