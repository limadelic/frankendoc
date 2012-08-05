class @Report

  constructor: ->
    @count = 0
    @failures = 0
    @empty_line()

  test: (@name, @results) ->
    @count++
    errors = @find_errors()
    if errors.length
    then @failed errors
    else @passed()

  find_errors: -> result for result in @results when not result.passed

  passed: -> console.log ' ✔ ' + @name

  failed: (errors) ->
    @failures++
    console.log ' ✖ ' + @name
    for error in errors
      console.log '    ' + error.step + ': ' + error.message

  totals: ->
    @empty_line()
    passed = @count - @failures
    console.log @count + ' tests, ' + passed + ' passed, ' + @failures + ' failed'

  empty_line: -> console.log ' '
