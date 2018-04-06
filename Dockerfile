FROM ubuntu:17.10
MAINTAINER Cylo "noc@cylo.io"

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "UsePAM yes" >> /etc/ssh/sshd_config

COPY scripts/entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/etc/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]