FROM ubuntu:latest as extract
ENV DEBIAN_FRONTEND=noninteractive

COPY ./assets/oss-cad-suite.tgz /tmp/oss-cad-suite.tgz
RUN tar -xzvf /tmp/oss-cad-suite.tgz -C /opt

FROM ubuntu:22.04 as base
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=extract /opt/oss-cad-suite /opt/oss-cad-suite

RUN apt update && apt upgrade
RUN apt install -y  \
        python3.11  \
        python3-pip

RUN pip3 install --no-cache-dir --upgrade pip             \
										  loguru          \
                                          numpy           \  
                                          matplotlib      \
                                          bokeh           \
                                          scipy           \
                                          cryptography    \
                                          pycryptodome    \
                                          pynacl          \
                                          edalize         \
                                          cocotb          \
                                          cocotb-coverage \
                                          cocotbext-axi   \
                                          cocotbext-uart  \
                                          cocotbext-spi   \
                                          cocotbext-eth   \
                                          cocotbext-pcie  \
                                          https://github.com/alexforencich/cocotbext-i2c/archive/master.zip \
                                          pyuvm     \
                                          vunit-hdl \
                                          vcp                                                               

LABEL maintainer="sibeov"
LABEL name="fpga-dev-suite"
LABEL version="0.0.1"
LABEL descripton="FPGA Development Suite contains OSS CAD Suite and various Python tools for development \
                  and verification of FPGA designs."

ENV PATH=$PATH:/opt/oss-cad-suite/bin