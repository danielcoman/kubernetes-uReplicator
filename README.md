# uReplicator Kubernetes Deployment


```
Kubernetes 1.8+
Prometheus:v2.1.0+
```

Apply 1:
```
kubectl apply -f namespace.yml
kubectl apply -f kafka-source/
kubectl apply -f kafka-destination/
```
Apply 2:
```
kubectl apply -f ureplicator/
kubectl apply -f mirror-maker/
kubectl apply -f kafka-monitor/
```


Source:
```
kubectl exec -it kafka-0   /bin/bash  -n kafka-source
./bin/kafka-topics.sh --create --zookeeper zookeeper.kafka-source.svc.cluster.local:2181 --replication-factor 1 --partitions 1 --topic test_topic_1
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test_topic_1
```


Destination:
```
unset JMX_PORT ;
kubectl exec -it kafka-0   /bin/bash  -n kafka-destination
./bin/kafka-topics.sh --create --zookeeper zookeeper.kafka-destination.svc.cluster.local:2181 --replication-factor 1 --partitions 1 --topic test_topic_1
./bin/kafka-topics.sh --list --zookeeper  zookeeper.kafka-destination.svc.cluster.local:2181
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test_topic_1

```

Perf:
```
unset JMX_PORT ;
./bin/kafka-producer-perf-test.sh --topic metric_test_1 --num-records 167772160 --throughput 16777216 --record-size 100 --producer-props acks=1 bootstrap.servers=localhost:9092 buffer.memory=67108864 compression.type=lz4 batch.size=8196
```

Image Build:
```
docker-compose -f docker/build.yml build
```


Debug:
```
kubectl logs -c  broker kafka-source-0 --namespace kafka-source -f
kubectl logs -c  metrics kafka-source-0 --namespace kafka-source -f
kubectl exec -ti  -c  metrics   kafka-source-0   /bin/bash --namespace  kafka-source
kubectl exec -ti -c broker kafka-source-0 bash --namespace kafka-source
```
