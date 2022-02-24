FROM minio/mc:latest
LABEL maintainer="toughIQ@gmail.com"

RUN apk add --no-cache bash

COPY setupS3.sh /.
COPY sync.sh /.

VOLUME /backup
VOLUME /restore

ENTRYPOINT ["/setupS3.sh"]
CMD ["/sync.sh"]

ENV S3_URL="" \
    S3_KEY="" \
    S3_SECRET="" \
    S3_PROTO="S3v4" \
    S3_REGION="default" \
    S3_BUCKET="" \
    S3_SYNC="" \
    S3_QUIET=1 \
    S3_DEBUG=0 \
    S3_WATCH=0 \
    S3_FORCE=0 \
    S3_REMOVE=0 \
