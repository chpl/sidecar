FROM ubuntu:jammy

ADD send /opt/sidecar/send
ADD worker /opt/sidecar/worker

ENV PATH="/opt/sidecar:${PATH}"

RUN groupadd -g 1000 sidecar
RUN useradd -u 1000 -g 1000 -s /bin/bash sidecar

USER 1000:1000