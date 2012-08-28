fs = require 'fs'
path = require 'path'

{ Reader } = require './confluence'
{ Docs } = require './docs'

class @Files

  constructor: ->
    @code = []
    @_docs = new Docs

  docs: -> @_docs.docs

  is_dir: -> fs.statSync(@file).isDirectory()
  skip_dir: -> @file.match /node_modules$/

  find_files: (dir, ext, add) -> 
    @add_suite dir

    for file in fs.readdirSync dir
      @find_file path.resolve(dir, file), ext, add
    
    @add_suite dir

  find_file: (@file, ext, add) ->
    if @is_dir()
    then @find_files(@file, ext, add) unless @skip_dir()
    else add() if @file.match(ext)

  read: ->
    @read_docs()
    @read_code()

  use_reader: -> @_docs = new Reader().read()

  read_docs: ->
    return @use_reader() if settings.docs.source isnt 'files'

    docs_type = new RegExp "\\#{settings.docs.type}$"

    @find_files settings.docs.root, docs_type, @add_doc

  add_doc: => @_docs.add(
    path.basename @file, settings.docs.type
    @contents()
  )

  add_suite: (name) -> @_docs.add_suite path.basename name

  contents: -> fs.readFileSync @file, 'utf8'

  read_code: ->
    @find_files settings.code.root, /\.(js|coffee)$/, =>
      @code.push @file

class Code

  constructor: ->
    @code = []
    @files = new @File
      ext: /\.(js|coffee)$/
      add: (file) => @code.push file

  read: -> @files.read settings.code.root

