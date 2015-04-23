var User = require('../proxy/user.js');
var url = require('url');
var eventproxy = require('eventproxy');
var tools = require('../common/tools');

exports.signup = function(req, res) {
  var url_parts = url.parse(req.url, true);
  var query = url_parts.query;

  //  var loginname = query.depTime;

  // var loginname = req.body.loginname;
  // var email = req.body.email;
  // var pass = req.body.pass;
  // var rePass = req.body.re_pass;

  var loginname = "foo";
  var email = "a@a.com";
  var pass = "123";
  var rePass = "123";
  var avatarUrl = "http://foo.bar";

  var ep = new eventproxy();
  User.getUsersByQuery({'$or': [
    {'loginname': loginname},
    {'email': email}
  ]}, {}, function (err, users) {
    if (err) {
      return next(err);
    }
    if (users.length > 0) {
      // ep.emit('prop_err', 'The username or the email has been used');
      res.send({
        inserted: 0,
        message: 'The username or the email has been used'
      })
      return;
    }

    tools.bhash(pass, ep.done(function (passhash) {

      User.newAndSave(loginname, loginname, passhash, email, avatarUrl, false, function (err) {
        if (err) {
          console.log(err)
          //return next(err);
        } else {
          res.send({
            inserted: 1,
            message: 'inserted user successfully'
          })
        }
        // send activation email
        // mail.sendActiveMail(email, utility.md5(email + passhash + config.session_secret), loginname);
        // res.render('sign/signup', {
        //   success: '歡迎加入 ' + config.name + ' 華航哩程數、長榮哩程數‧拍賣交換！'
        // });
      });

    }));
  });
};

exports.login = function (req, res) {

  // http://localhost:9701/login?loginname=foo&pass=123
  var url_parts = url.parse(req.url, true);
  var query = url_parts.query;

  var loginname = query.loginname;
  var pass = query.pass;

  // var loginname = "foo";
  // var pass = "124";
  var ep = new eventproxy();

  if (!loginname || !pass) {
    res.status(422);
    res.send({
      loggedIn: 0,
      message: 'information not completed'
    })
  } else {

  var getUser = User.getUserByLoginName;

  getUser(loginname, function (err, user) {
    if (err) {
      return next(err);
    }
    if (!user) {
      res.send({
        loggedIn: 0,
        message: 'login error'
      })
    }
    var passhash = user.pass;
    tools.bcompare(pass, passhash, ep.done(function (bool) {
      if (!bool) {
        res.send({
          loggedIn: 0,
          message: 'login error'
        })
      }
    //  if (!user.active) {
    //    // resend activation email
    //    mail.sendActiveMail(user.email, utility.md5(user.email + passhash + config.session_secret), user.loginname);
    //    res.status(403);
    //    return res.render('sign/signin', { error: 'the email is not verified yet' });
    //  }
      // store session cookie

      //check at some page just jump to home page
      res.send({
        loggedIn: 1
      })
    }));
  });
  }
};
