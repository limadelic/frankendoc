fs = require 'fs'
path = require 'path'

class @Files

  docs: []
  code: []

  is_dir: -> fs.statSync(@file).isDirectory()
  
  find_files: (dir, ext, add) -> for file in fs.readdirSync dir
    @file = path.resolve dir, file
    @find_files @file, ext, add if @is_dir()
    add() if @file.match ext
  
  load: -> 
    @load_docs()
    @load_code()

  load_docs: ->
    return unless settings.docs.source is 'files'
    
    docs_type = new RegExp "\\#{settings.docs.type}$"

    @find_files settings.docs.root, docs_type, @add_doc

  add_doc: => @docs.push
    name: path.basename @file, settings.docs.type
    content: fs.readFileSync @file, 'utf8'

  load_code: ->
    @find_files settings.code.root, /\.(js|coffee)$/, =>
      @code.push @file

