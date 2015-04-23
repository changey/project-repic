var mongoose = require('mongoose');
var Schema = mongoose.Schema;
require('../config.js');

var UserSchema = new Schema({
  name: { type: String},
  loginname: { type: String},
  pass: { type: String },
  email: { type: String},
  profile_image_url: {type: String}
});

module.exports = mongoose.model('User', UserSchema);
