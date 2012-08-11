fs = require 'fs'
path = require 'path'

require '../settings'

class @Settings

  load: ->
    ext = path.extname settings.docs.root
    if ext.length
      settings.docs.root = path.dirname settings.docs.root
      settings.docs.type = ext
