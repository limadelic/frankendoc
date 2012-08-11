fs = require 'fs'
path = require 'path'

class @Files

  constructor: ->
    @tests = []
    @suts = []
  
  load: -> 
    @doc_type = new RegExp "\\#{settings.docs.type}$"
    @find_files settings.docs.root

  is_dir: -> fs.statSync(@file).isDirectory()
  is_test: -> @file.match @doc_type
  is_sut: -> @file.match /\.(js|coffee)$/

  find_files: (dir) -> for file in fs.readdirSync dir
    @file = path.resolve dir, file
    @find_files @file if @is_dir()
    @add_test() if @is_test()
    @add_sut() if @is_sut()

  add_test: -> @tests.push
    name: path.basename @file, settings.docs.type
    content: fs.readFileSync @file, 'utf8'

  add_sut: -> @suts.push @file

