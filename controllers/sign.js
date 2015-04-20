var User = require('../proxy').User;

exports.signup = function(req, res) {
  var loginname = req.body.loginname;
  var email = req.body.email;
  var pass = req.body.pass;
  var rePass = req.body.re_pass;

  var ep = new eventproxy();
  User.getUsersByQuery({'$or': [
    {'loginname': loginname},
    {'email': email}
  ]}, {}, function (err, users) {
    if (err) {
      return next(err);
    }
    if (users.length > 0) {
      ep.emit('prop_err', '帳戶名或電子信箱已被使用。');
      return;
    }

    tools.bhash(pass, ep.done(function (passhash) {

      User.newAndSave(loginname, loginname, passhash, email, avatarUrl, false, function (err) {
        if (err) {
          console.log(err)
          //return next(err);
        } else {
          console.log("success")
        }
        // 发送激活邮件
        // mail.sendActiveMail(email, utility.md5(email + passhash + config.session_secret), loginname);
        // res.render('sign/signup', {
        //   success: '歡迎加入 ' + config.name + ' 華航哩程數、長榮哩程數‧拍賣交換！'
        // });
      });

    }));
}
