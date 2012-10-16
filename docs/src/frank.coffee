{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    console.log output
    console.log $ 'coffee src/frank ' + args
