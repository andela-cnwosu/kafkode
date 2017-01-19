(function(){
	const Kafka = require('no-kafka');
	const dns = require('dns');
	const consumer = new Kafka.SimpleConsumer({
		connectionString: 'localhost:9091'
	});
	const subscriptions = ['kafkode-topic'];

	var dataHandler = function (messageSet, topic, partition) 
	{
			messageSet.forEach(function (m) {
					console.log(topic, 'received');
					console.log({
							'partition': partition,
							'offset': m.offset,
							'message': m.message.value.toString('utf8')
					});
			});
	};

	consumer.init()
	.then(function () {
			return consumer.subscribe('kafkode-topic', 0, dataHandler);
	});
})();
