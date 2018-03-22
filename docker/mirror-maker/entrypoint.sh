#!/bin/sh


exec /mirror-maker/bin/kafka-mirror-maker.sh \
          --consumer.config /mirror-maker/config/consumer.properties \
          --producer.config /mirror-maker/config/producer.properties \
          --new.consumer \
          --whitelist '.*' \
          --offset.commit.interval.ms 1000
