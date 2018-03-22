FROM openjdk:8-jre-alpine

RUN apk --update add tar bash libstdc++ bind-tools && \
    rm -rf /tmp/* /var/cache/apk/*

COPY kafka_2.12-1.0.1.tgz /
RUN tar -zxf kafka_2.12-1.0.1.tgz -C / && \
    mv /kafka_2.12-1.0.1 /mirror-maker && \
    rm -f kafka_2.12-1.0.1.tgz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]
