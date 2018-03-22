FROM openjdk:8-jre-alpine

RUN apk --update add tar bash libstdc++ bind-tools && \
    rm -rf /tmp/* /var/cache/apk/*

COPY kafka-monitor-132a5321caa764652809f3aec9b6a31bb9d4ca6d.tgz /
RUN tar -zxf kafka-monitor-132a5321caa764652809f3aec9b6a31bb9d4ca6d.tgz -C / && \
    rm -f kafka-monitor-132a5321caa764652809f3aec9b6a31bb9d4ca6d.tgz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]
