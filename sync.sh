#!/bin/bash
set -e

if [ "$S3_QUIET" -ne 0 ]; then
    QUIET="--quiet"
fi

if [ "$S3_DEBUG" -ne 0 ]; then
    DEBUG="--debug"
fi

if [ "$S3_WATCH" -ne 0 ]; then
    WATCH="--watch"
fi

if [ "$S3_FORCE" -ne 0 ]; then
    FORCE="--force"
fi

if [ "$S3_REMOVE" -ne 0 ]; then
    REMOVE="--remove"
fi

if [ "$S3_SYNC" == "up" ]; then
#    echo "mc $DEBUG mb s3/$S3_BUCKET"
#    mc $DEBUG mb s3/$S3_BUCKET
    echo "mc $DEBUG $QUIET mirror $WATCH $FORCE $REMOVE /backup s3/$S3_BUCKET"
    mc $DEBUG $QUIET mirror $WATCH $FORCE $REMOVE /backup s3/$S3_BUCKET
elif [ "$S3_SYNC" == "down" ]; then
    echo "mc $DEBUG $QUIET mirror $WATCH $FORCE $REMOVE s3/$S3_BUCKET /restore"
    mc $DEBUG $QUIET mirror $WATCH $FORCE $REMOVE s3/$S3_BUCKET /restore
else
    echo "Please set S3_SYNC to \"up\" or \"down\"."
fi
