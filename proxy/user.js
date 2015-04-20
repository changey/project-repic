var models = require('../models/user.js');
var utility = require('utility');

exports.newAndSave = function(name, loginname, pass, email, avatar_url, active, callback) {
  var user = new User();
  user.name = loginname;
  user.loginname = loginname;
  user.pass = pass;
  user.email = email;
  user.avatar = avatar_url;
  user.active = active || false;
  user.save(callback);
};
