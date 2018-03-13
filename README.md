# uReplicator Kubernetes Deployment




Source:
```
kubectl exec -it kafka-0   /bin/bash  -n kafka-source
./bin/kafka-topics.sh --create --zookeeper zookeeper.kafka-source.svc.cluster.local:2181 --replication-factor 1 --partitions 1 --topic test_topic_1
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test_topic_1
```


Destination:
```
kubectl exec -it kafka-0   /bin/bash  -n kafka-destination
./bin/kafka-topics.sh --create --zookeeper zookeeper.kafka-destination.svc.cluster.local:2181 --replication-factor 1 --partitions 1 --topic test_topic_1
./bin/kafka-topics.sh --list --zookeeper  zookeeper.kafka-destination.svc.cluster.local:2181
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test_topic_1

```

Perf:
```
./bin/kafka-producer-perf-test.sh --topic test_topic_1 --num-records 16777216 --throughput 16777216 --record-size 256 --producer-props acks=1 bootstrap.servers=localhost:9092 buffer.memory=67108864 compression.type=lz4 batch.size=8196
```

Image Build:
```
docker-compose -f docker/build.yml build
```
