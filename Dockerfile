FROM ubuntu:12.04

USER root
RUN apt-get update
RUN apt-get install -yq mc iputils-ping git vim python-pip

ENV PERMANENT_USER="John"

RUN useradd -m -d /home/john -s /bin/bash john
ADD start.sh /home/john

RUN cd /home/john ; git clone https://github.com/MagnetonBora/elastic_network.git
RUN cd /home/john/elastic_network ; pip install -r requirements.txt

CMD "/home/john/start.sh"