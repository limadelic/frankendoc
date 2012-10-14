_ = require 'underscore'

class @Doc

  constructor: (@opt = {}) ->
    @opt.line_break ?= '\r\n'
    @opt.multiline_arg ?= '"""'
    @opt.code_block = settings.docs.code_block ? @opt.code_block

  read: (doc) ->
    @steps = []
    @read_lines @tokenize @code doc
    @steps

  code: (doc) ->
    return doc unless @opt.code_block?
    code = ''
    while (match = @opt.code_block.exec doc)?
      code += match[1] + @opt.line_break
    code

  tokenize: (doc) -> _.compact doc.split @opt.line_break

  read_lines: (lines) -> for line in lines
    @read_multiline_arg(line) ?
    @add(line)

  add: (line) -> @steps.push
    name: line.trim()
    args: []
  
  read_multiline_arg: (line) ->
    is_token = line.trim() is @opt.multiline_arg

    return unless is_token or @arg?
    return @arg = '' if is_token and not @arg?
    return @arg += line + @opt.line_break if not is_token
    return @add_multiline_arg()

  add_multiline_arg: ->
    _.last(@steps)?.multiline_arg = @arg
    @arg = undefined
    true


