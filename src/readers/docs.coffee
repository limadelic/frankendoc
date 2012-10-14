fs = require 'fs'
path = require 'path'
_ = require 'underscore'
{ Doc } = require './doc'
{ Files } = require './files'

@read = ->
  @docs = new @Docs
  files = new Files
    
    ext: new RegExp "\\#{settings.docs.type}$"
    
    found: (file) => @docs.add(
      path.basename file, settings.docs.type
      fs.readFileSync file, 'utf8'
    )

    start: (dir) => @docs.add_suite path.basename dir
    end: (dir) => @docs.add_suite path.basename dir


  files.read settings.docs.root
  @docs.docs


class @Docs

  constructor: (opt) ->
    @docs = []
    @doc = new Doc opt

  add: (name, content) ->
    return if @filter name

    @docs.push
      name: name
      steps: @doc.read content
    @last()

  filter: (name) ->
    settings.only? and not name.match settings.only

  add_suite: (name) ->
    return if @removed_empty_suite(name)?
    
    @docs.push
      name: name
      is_suite: true

    @last()

  removed_empty_suite: (name) ->
    @docs.pop() if @last()?.is_suite and @last().name is name

  last: -> _.last @docs
