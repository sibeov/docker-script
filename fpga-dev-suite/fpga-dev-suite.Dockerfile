# Extraction stage
FROM ubuntu:latest as extract
ENV DEBIAN_FRONTEND=noninteractive

# Get latest release of oss-cad-suite
WORKDIR /tmp
RUN wget -O ./oss-cad-suite.tgz https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-07-29/oss-cad-suite-linux-x64-20240729.tgz
RUN tar -xzvf ./oss-cad-suite.tgz -C /opt

# Base stage
FROM ubuntu:22.04 as base
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=extract /opt/oss-cad-suite /opt/oss-cad-suite

# Update and upgrade the system
RUN apt update -y && apt upgrade -y

# Install TCL
RUN apt install -y tclsh tcllib

# Install Python and pip
RUN apt install -y python3 python3-pip

# Fix symbolic links
RUN ln -sf /usr/bin/python3.10 /usr/bin/python
RUN ln -sf /usr/bin/python3.10 /usr/bin/python3

# Install required pip packages
RUN pyton3 -m pip install --no-cache-dir --upgrade -r ./requirements.txt

LABEL maintainer="sibeov"
LABEL name="fpga-dev-suite"
LABEL version="0.0.3"
LABEL descripton="FPGA Development Suite contains OSS CAD Suite and various Python tools for development \
                  and verification of FPGA designs."

RUN export PATH="${PATH}:/opt/oss-cad-suite/bin:/opt/oss-cad-suite/py3bin"