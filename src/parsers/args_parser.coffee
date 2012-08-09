_ = require 'underscore'

class @StepArgsParser

  args_matcher = /'(.*?)'/g

  normalized: (line) -> line.replace args_matcher, '@x'

  parse: (line) -> @cleanup line.match args_matcher

  cleanup: (args) -> _.map args, (arg) -> arg[1..-2]
