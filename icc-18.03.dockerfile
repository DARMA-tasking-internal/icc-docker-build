
ARG arch=amd64
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir intel

COPY COM____DDW8-CKHSP7GN.lic intel
COPY silent.cfg intel

RUN apt-get update -y -q

RUN apt-get install -y -q --no-install-recommends \
    less \
    gcc \
    g++ \
    wget \
    cpio

RUN cd intel && \
    wget http://registrationcenter-download.intel.com/akdlm/irc_nas/13398/system_studio_2018_update_2_ultimate_edition.tar.gz && \
    tar xzf system_studio_2018_update_2_ultimate_edition.tar.gz && \
    rm system_studio_2018_update_2_ultimate_edition.tar.gz && \
    cd system_studio_2018* && \
    cp ../silent.cfg . && \
    ./install.sh -s silent.cfg && \
    cd ../../ && \
    rm -rf intel && \
    rm -rf /tmp/*

RUN ln -s \
    /opt/intel/system_studio_2018 \
    /opt/intel/install
