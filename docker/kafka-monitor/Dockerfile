FROM openjdk:8-jre-alpine

RUN apk --update add tar bash libstdc++ bind-tools && \
    rm -rf /tmp/* /var/cache/apk/*

COPY kafka-monitor.tgz /
RUN tar -zxf  kafka-monitor.tgz -C / && \
    rm -f kafka-monitor.tgz

COPY config /kafka-monitor/config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]
