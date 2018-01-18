FROM solsson/kafka-initutils@sha256:c275d681019a0d8f01295dbd4a5bae3cfa945c8d0f7f685ae1f00f2579f08c7d

RUN mkdir /ureplicator
COPY bin /ureplicator/

RUN chmod u+x /ureplicator/*.sh && \
    chmod u+x /ureplicator/pkg/*.sh
