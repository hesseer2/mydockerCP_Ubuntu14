# Writen by Erik Hesse
# Company: Novartis NIBR NX IS-Delta
# Date: 8-2-2016

FROM ubuntu:14.04 

MAINTAINER Erik Hesse <erik.hesse@msn.com>

 RUN apt-get update && apt-get install -y \
  cython             \
  git                \
  libmysqlclient-dev \
  libhdf5-dev        \
  libxml2-dev        \
  libxslt1-dev       \
  openjdk-7-jdk      \
  python-dev         \
  python-pip         \
  python-h5py        \
  python-matplotlib  \
  python-mysqldb     \
  python-scipy       \
  python-vigra       \
  python-wxgtk2.8    \
  python-zmq

RUN pip install --upgrade cython
RUN pip install dask
RUN pip install --upgrade six
RUN git clone https://github.com/CellProfiler/CellProfiler.git /opt/CellProfiler
RUN cd /opt/CellProfiler/
RUN pip install --editable /opt/CellProfiler/
RUN pip uninstall prokaryote
RUN pip install prokaryote
RUN pip install javabridge