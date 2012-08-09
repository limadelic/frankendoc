_ = require 'underscore'
{ StepParser } = require './step_parser'

class @Parser

  setup: ->
    @results = []
    @steps = new StepParser @results

  parse: (test) ->
    @setup()
    @parse_lines @tokenize test
    @results

  tokenize: (test) -> _.compact test.split '\r\n'

  parse_lines: (steps) -> @steps.parse step.trim() for step in steps
