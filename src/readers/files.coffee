fs = require 'fs'
path = require 'path'

{ Reader } = require './confluence'
{ Doc } = require './doc'

class @Files

  constructor: ->
    @docs = []
    @code = []
    @doc = new Doc

  is_dir: -> fs.statSync(@file).isDirectory()

  find_files: (dir, ext, add) -> 
    @add_suite dir
    for file in fs.readdirSync dir
      @file = path.resolve dir, file
      if @is_dir()
        @find_files @file, ext, add unless file is 'node_modules' 
      else if @file.match ext
        add()
    @add_suite dir

  read: ->
    @read_docs()
    @read_code()

  use_reader: ->
    reader = new Reader
    reader.docs = @docs
    reader.read()

  read_docs: ->
    return @use_reader() if settings.docs.source isnt 'files'

    docs_type = new RegExp "\\#{settings.docs.type}$"

    @find_files settings.docs.root, docs_type, @add_doc

  add_doc: => @docs.push
    name: path.basename @file, settings.docs.type
    steps: @doc.read @contents()

  add_suite: (name) -> @docs.push
    name: name
    is_suite: true

  contents: -> fs.readFileSync @file, 'utf8'

  read_code: ->
    @find_files settings.code.root, /\.(js|coffee)$/, =>
      @code.push @file

