var express = require('express');
var sign = require('./controllers/sign');

var router = express.Router();

router.get('/', function (req, res) {
  res.send('Hello World!');
});

module.exports = router;
