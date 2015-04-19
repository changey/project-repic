var mongoose = require("mongoose");

var uristring;

uristring = 'mongodb://localhost:27017/repic_dev';

mongoose.connect(uristring, function(err, res) {
  if(err) {
    console.log('ERROR connecting to: ' + uristring + '. ' + err);
  }
  else {
    console.log('Succeeded connected to: ' + uristring);
  }
});

// In case the browser connects before the database is connected, the
// user will see this message.
var found = ['DB Connection not yet established.  Try again later.  Check the console output for error messages if this persists.'];
