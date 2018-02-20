#!/bin/sh

cd /uReplicator/bin/

if [ ${SERVICE_TYPE} == "controller" ] ; then
./start-controller.sh \
          -port 9000 \
          -zookeeper zookeeper.ureplicator.svc.cluster.local:2181 \
          -helixClusterName testMirrorMaker \
          -backUpToGit false \
          -autoRebalanceDelayInSeconds 120 \
          -localBackupFilePath /tmp/uReplicator-controller \
          -enableAutoWhitelist true \
          -enableAutoTopicExpansion true \
          -srcKafkaZkPath zookeeper.kafka-source.svc.cluster.local:2181 \
          -destKafkaZkPath zookeeper.kafka-destination.svc.cluster.local:2181 \
          -initWaitTimeInSeconds 10 \
          -refreshTimeInSeconds 20

elif [ ${SERVICE_TYPE} == "worker" ] ; then
./start-worker.sh \
          --helix.config /uReplicator/config/helix.properties \
          --consumer.config /uReplicator/config/consumer.properties \
          --producer.config /uReplicator/config/producer.properties
fi
