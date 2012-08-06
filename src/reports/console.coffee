class @Report

  constructor: ->
    @total = @failures = @pending = 0
    @empty_line()

  test: (@name, @results) ->
    @total++
    @parse_results()

    if @failed_steps.length then @test_failed()
    else if @pending_steps.length then @test_pending()
    else @test_passed()

    @report_unsuccessful_steps()

  parse_results: ->
    @failed_steps = []
    @pending_steps = []
    for result in @results
      @pending_steps.push result if result.pending
      @failed_steps.push result if result.failed

  test_passed: -> console.log ' √ ' + @name

  test_failed: ->
    @failures++
    console.log ' x ' + @name

  test_pending: ->
    @pending++
    console.log ' o ' + @name

  report_unsuccessful_steps: ->
    for result in @pending_steps
      console.log '     ' + result.step + ': pending'
    for result in @failed_steps
      console.log '     ' + result.step + ': ' + result.message

  totals: ->
    @empty_line()
    passed = @total - @failures - @pending
    console.log @total + ' tests, ' +
      passed + ' passed, ' +
      @failures + ' failed, ' +
      @pending + ' pending'

  empty_line: -> console.log ' '
