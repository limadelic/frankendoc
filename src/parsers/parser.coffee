_ = require 'underscore'
{ StepParser } = require './step_parser'
{ FuncParser } = require './func_parser'

class exports.Parser

  constructor: ->
    @results = []
    @steps = new StepParser @results
    @funcs = new FuncParser @steps

  parse: (test) ->
    @parse_lines @tokenize test
    @results

  tokenize: (test) -> _.compact test.split '\r\n'

  parse_lines: (steps) -> @parse_line step for step in steps

  parse_line: (line) ->
    @funcs.parse(line) ?
    @steps.parse(line)

