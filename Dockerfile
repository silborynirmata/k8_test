FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y apt-transport-https gpg wget sendemail ca-certificates libio-socket-ssl-perl libnet-ssleay-perl &&\
    wget https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    apt-key add apt-key.gpg && rm -f apt-key.gpg ;\
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list &&\
    apt-get update &&\
    apt-get install -y kubectl &&\
    apt-get remove -y wget apt-transport-https gpg &&\
    apt-get autoremove -y &&\
    apt-get clean all

COPY nirmata_test.sh /scripts/k8_test/k8_test.sh
