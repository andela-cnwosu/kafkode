ZOO_PORT = localhost:2180
KAF_PORT = localhost:9091
KAFKA_BIN_PATH = opt/kafka_2.11-0.10.1.0/bin
KAFKA_CONF_PATH = opt/kafka_2.11-0.10.1.0/config
TTAB_PATH = node_modules/.bin/ttab
TOPICS = kafka-topic

create_topics:
	for topic in $(TOPICS); do \
		$(KAFKA_BIN_PATH)/kafka-topics.sh --create --zookeeper $(PORT) --replication-factor 1 --partitions 1 --topic $$topic; \
	done

list_topics:
	$(KAFKA_BIN_PATH)/kafka-topics.sh --list --zookeeper $(PORT)

start_zoo:
	$(KAFKA_BIN_PATH)/zookeeper-server-start.sh $(KAFKA_CONF_PATH)/zookeeper.properties

start_kafka:
	$(KAFKA_BIN_PATH)/kafka-server-start.sh $(KAFKA_CONF_PATH)/server.properties

start_producer:
	node kafka_producer.js

start_consumer:
	node kafka_consumer.js

start_zoo_new_terminal:
	$(TTAB_PATH) $(KAFKA_BIN_PATH)/zookeeper-server-start.sh $(KAFKA_CONF_PATH)/zookeeper.properties

start_kafka_new_terminal:
	$(TTAB_PATH) $(KAFKA_BIN_PATH)/kafka-server-start.sh $(KAFKA_CONF_PATH)/server.properties

start_consumer_new_terminal:
	sleep 10; $(TTAB_PATH) node kafka_consumer.js

start_producer_new_terminal:
	$(TTAB_PATH) node kafka_producer.js

# Start servers, consumer and producer. A delay of 10 seconds is set before consumer is started
all: start_zoo_new_terminal start_kafka_new_terminal start_consumer_new_terminal start_producer_new_terminal