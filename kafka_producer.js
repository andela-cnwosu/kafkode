(function(){
	var Kafka = require('no-kafka');
	var connectionString = ' kafka://localhost:9091, localhost:9091 ';
	var producer = new Kafka.Producer({ connectionString: connectionString });

	producer.init()
	.then(function(){
		return producer.send({
				message: {
						value: 'Hello!'
				},
				topic: 'kafkode-topic',
				partition: 0
		});
	})
	.then(function (result) {
		console.log('topic sent');
	});
})();