_ = require 'underscore'

class @Doc

  constructor: (@opt = {}) ->
    @opt.line_break ?= '\r\n'

  read: (doc) ->
    @results = []
    @parse_lines @tokenize @code doc
    @results

  code: (doc) ->
    return doc unless @opt.code_block?
    code = ''
    while (match = @opt.code_block.exec doc)?
      code += match[1] + @opt.line_break
    code

  tokenize: (doc) -> _.compact doc.split @opt.line_break

  parse_lines: (steps) -> for step in steps
    @results.push
      name: step.trim()
      args: []
