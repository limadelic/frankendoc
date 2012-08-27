{ Doc } = require './doc'
_ = require 'underscore'

class @Docs

  constructor: (opt) ->
    @docs = []
    @doc = new Doc opt

  add: (name, content) -> 
    @docs.push
      name: name
      steps: @doc.read content
    @last()

  add_suite: (name) -> 
    return if @removed_empty_suite(name)?
    
    @docs.push
      name: name
      is_suite: true

    @last()

  removed_empty_suite: (name) ->
    @docs.pop() if @last()?.is_suite and @last().name is name

  last: -> _.last @docs
