var express = require('express');
var sign = require('./controllers/sign');

var router = express.Router();

router.get('/signup', sign.signup);  // redirect to the sign up page
router.get('/login', sign.login);

module.exports = router;
