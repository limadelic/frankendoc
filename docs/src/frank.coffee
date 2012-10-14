{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args) ->
    console.log args
    console.log $ 'coffee src/frank ' + args
