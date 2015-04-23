var express = require('express');
var sign = require('./controllers/sign');
var multer = require('multer');

var router = express.Router();

router.get('/signup', sign.signup); // redirect to the sign up page
router.get('/login', sign.login);
router.post('/uploadPhoto',[ multer({ dest: './uploads/'}), function(req, res){
    console.log(req.body) // form fields
    console.log(req.files) // form files
    res.status(204).end()
}]);


module.exports = router;
