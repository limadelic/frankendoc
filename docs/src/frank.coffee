{ frank } = require '../../src/frankendoc'

class @Frank

  '> frank @path': (path) ->
    settings.docs.root = path
    frank()

