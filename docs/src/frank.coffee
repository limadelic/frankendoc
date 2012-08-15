{ frank } = require '../../src/frankendoc'

class @Frank
  '> frank (.*)': (path) ->
    settings.docs.root = path
    frank()

