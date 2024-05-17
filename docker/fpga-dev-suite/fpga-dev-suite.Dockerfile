FROM ubuntu:latest as extract
ENV DEBIAN_FRONTEND=noninteractive
COPY ./assets/oss-cad-suite.tgz /tmp/oss-cad-suite.tgz
RUN tar -xzvf /tmp/oss-cad-suite.tgz -C /opt