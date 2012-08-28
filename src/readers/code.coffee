{ Files } = require 'files'

class @Code

  constructor: ->
    @code = []
    @files = new @Files
      ext: /\.(js|coffee)$/
      add: (file) => @code.push file

  read: -> @files.read settings.code.root

