var mongoose = require('mongoose');
var Schema = mongoose.Schema;
require('../config.js');

var PhotoSchema = new Schema({
  url: { type: String},
  sender_id: { type: String},
  sender_loginname: { type: String},
  receiver_ids: { type: Array },
  receiver_loginnames: { type: Array },
});

module.exports = mongoose.model('Photo', PhotoSchema);
