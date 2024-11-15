# Extraction stage
FROM yosyshq/cross-base:2.0 AS extract
ENV DEBIAN_FRONTEND=noninteractive

# Get latest release of oss-cad-suite
WORKDIR /work
RUN wget -v -O ./oss-cad-suite.tgz https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-07-29/oss-cad-suite-linux-x64-20240729.tgz
RUN tar -xzvf ./oss-cad-suite.tgz -C /opt

# Base stage
FROM yosyshq/cross-base:2.0 AS base
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=extract /opt/oss-cad-suite /opt/oss-cad-suite

# Update and upgrade the system
RUN apt update -y && apt upgrade -y

# Install TCL
RUN apt install -y tclsh tcllib

# Install Python and pip
RUN apt install -y python3 python3-pip build-essential python3-dev

# Fix symbolic links
RUN ln -sf /usr/bin/python3.10 /usr/bin/python
RUN ln -sf /usr/bin/python3.10 /usr/bin/python3

# Install required pip packages
RUN pip3 install -r ./requirements.txt --no-cache-dir --upgrade

# Clean up
RUN apt autoremove -y
RUN apt autoclean -y

# Export paths to OSS CAD Suite
RUN export PATH="${PATH}:/opt/oss-cad-suite/bin:/opt/oss-cad-suite/py3bin"

LABEL maintainer="sibeov"
LABEL name="fpga-dev-suite"
LABEL version="0.0.3"
LABEL descripton="FPGA Development Suite contains OSS CAD Suite and various Python tools for development \
                  and verification of FPGA designs."
