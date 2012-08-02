should = require 'should'

users_msg =
  Jim: 'Hello lizard king'
  Pam: 'Hello turkey murderer'
  default: 'Hello world'

class @Login

  'when an user logs in': -> @msg = users_msg.default

  'it should be greeted': -> @msg.should.not.be.undefined

  'when @x logs in': (user) -> @msg = users_msg[user]

  'it should say @x': (msg, done) -> process.nextTick =>
    msg.should.eql @msg
    done()

  'when .* logs in': -> @['when an user logs in']()

  'it should greet (her|him)': -> @['it should be greeted']()
