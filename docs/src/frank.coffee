{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args) ->
    $ 'coffee src/frank ' + args
