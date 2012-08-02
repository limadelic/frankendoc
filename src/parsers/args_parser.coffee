_ = require 'underscore'

class @StepArgsParser

  args_matcher = /'(.*?)'/g

  normalized: (line) -> line.replace args_matcher, '@x'

  parse: (line) -> @cleanup line.match args_matcher

  cleanup: (args) -> _.map args, (arg) -> arg[1..-2]

class @FuncArgsParser

  args_matcher = /(@\S+)/g

  normalized: (func) -> func.replace args_matcher, '@x'

  parse: (func) -> func.match args_matcher

  inline: (step, func) ->
    return step unless func.args_names?
    for arg, i in func.args_names
      step = step.replace ///#{arg}///g, func.args_values[i]
    step
