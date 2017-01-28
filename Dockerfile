FROM ubuntu:14.04
WORKDIR /install
ADD install.sh /install/install.sh
RUN bash /install/install.sh