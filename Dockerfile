FROM python:3.5

MAINTAINER IS24

RUN mkdir -vp /tmp/pyflann

ADD . /tmp/pyflann

RUN /bin/bash -c "cd /tmp/pyflann; ./build_and_upload.sh"
