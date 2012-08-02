{ StepArgsParser } = require './args_parser'

class @StepParser

  constructor: (@steps) ->
    @args = new StepArgsParser

  parse: (line) -> @steps.push
    title: line
    name: @args.normalized line
    args: @args.parse line
