{ exec } = require 'child_process'

class @Frank

  '> frank @args': (args, done) ->
    exec 'coffee src/frank ' + args, (err, @out) -> done err

