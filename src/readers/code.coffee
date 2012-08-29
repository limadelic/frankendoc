{ Files } = require './files'
{ Classes } = require './classes'

@read = -> new Classes read_files()  

read_files = ->

    @code = []
    files = new Files
      ext: /\.(js|coffee)$/
      found: (file) => @code.push file

    files.read settings.code.root
    @code
