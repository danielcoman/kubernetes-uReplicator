#!/bin/sh

cd /kafka-monitor

exec ./bin/kafka-monitor-start.sh ./config/multi-cluster-monitor.properties
