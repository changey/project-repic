var express = require('express');
var app = express();
var sign = require('./controllers/sign.js');
var webRouter = require('./web_router');

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.use('/', webRouter);

var server = app.listen(9701, function () {

  //var host = server.address().address;
  var host = "127.0.0.1";
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);

});
