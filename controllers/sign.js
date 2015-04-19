var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var utility = require('utility');

var userSchema = new Schema({
  name: { type: String},
  loginname: { type: String},
  pass: { type: String },
  email: { type: String},
  profile_image_url: {type: String}
});
