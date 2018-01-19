#!/bin/sh

cd /uReplicator/uReplicator-Distribution/target/uReplicator-Distribution-pkg/bin/

if [ ${SERVICE_TYPE} == "controller" ] ; then
./start-controller.sh \
          -port 9000 \
          -zookeeper zookeeper.ureplicator.svc.cluster.local:2181 \
          -helixClusterName testCluster \
          -backUpToGit false \
          -autoRebalanceDelayInSeconds 120 \
          -localBackupFilePath /tmp/uReplicator-controller \
          -enableAutoWhitelist true \
          -enableAutoTopicExpansion true \
          -srcKafkaZkPath zookeeper.kafka-source.svc.cluster.local:2181 \
          -destKafkaZkPath zookeeper.kafka-destination.svc.cluster.local:2181

elif [ ${SERVICE_TYPE} == "worker" ] ; then
./start-worker.sh \
          -consumer.config /uReplicator/config/consumer.properties \
          -producer.config /uReplicator/config/producer.properties \
          -helix.config /uReplicator/config/helix.properties
fi
