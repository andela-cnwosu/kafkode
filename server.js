let express = require('express');
const port = 8000;
const app = express();

app.use(express.static(__dirname + '/public'));
app.listen(port, function(){
    console.log("Kafkode listening on port", port);
});

app.get('*', function(req, res){
    res.send('Hello!');
});
