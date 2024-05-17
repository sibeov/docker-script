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

ENV PATH="$PATH:/opt/oss-cad-suite/bin"

ENTRYPOINT ["/bin/bash"]