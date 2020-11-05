FROM ubuntu:focal

RUN apt-get update \
 && apt-get install -y \
   python3 \
   python3-pip \
 && python3 -m pip install \
   ansible \
   paramiko
