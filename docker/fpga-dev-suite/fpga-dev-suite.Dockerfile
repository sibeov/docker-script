FROM ubuntu:22.04 as base
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
	apt install -y \
	build-essential \
	git \
	python3 \
	python3-pip \
	make
	# cmake \
	# libboost-all-dev \
	# libeigen3-dev \
	# libgmp-dev \
	# libmpfr-dev \
	# libmpc-dev \
	# libreadline-dev \
	# libssl-dev \
	# libtool \
	# libxml2-dev \
	# pkg-config \
	# wget \
	# zlib1g-dev