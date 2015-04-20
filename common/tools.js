var bcrypt = require('bcrypt');

exports.bhash = function (str, callback) {
  bcrypt.hash(str, 10, callback);
};
