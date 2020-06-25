
# ARG http_proxy=http://wwwproxy.sandia.gov:80/
# ARG https_proxy=http://wwwproxy.sandia.gov:80/
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
    wget --no-check-certificate https://registrationcenter-download.intel.com/akdlm/irc_nas/16580/intel-sw-tools-installer.tar.gz && \
    tar xzf intel-sw-tools-installer.tar.gz && \
    rm intel-sw-tools-installer.tar.gz && \
    cd intel-sw-tools* && \
    cp ../silent.cfg . && \
    ./install.sh -s silent.cfg && \
    cd ../../ && \
    rm -rf intel && \
    rm -rf /tmp/*

RUN ln -s \
    /opt/intel/sw_dev_tools \
    /opt/intel/install

RUN ln -s \
    /opt/intel/sw_dev_tools/compilers_and_libraries_2020.1.219/linux/compiler/lib/intel64_lin/ \
    /opt/intel/ld_library_path
