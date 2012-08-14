_ = require 'underscore'
{ StepParser } = require './step_parser'

class @Parser

  constructor: (@opt = {}) ->
    @opt.line_break ?= '\r\n'

  setup: ->
    @results = []
    @steps = new StepParser @results

  parse: (test) ->
    @setup()
    @parse_lines @tokenize test
    @results

  tokenize: (test) -> _.compact test.split @opt.line_break

  parse_lines: (steps) -> @steps.parse step.trim() for step in steps
