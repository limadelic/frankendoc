class @Report

  constructor: ->
    @empty_line()
    @total =
      tests: 0
      passed: 0
      failed: 0
      pending: 0
      time: 0

  icons:
    passed: ' √ '
    failed: ' x '
    pending: ' o '

  start: (@name) ->
    @started = new Date

  stop: (@results) ->
    @record_time()
    @parse_results()
    @set_status()
    @report_test()
    @report_unsuccessful_steps()

  record_time: ->
    @duration = new Date - @started
    @total.time += @duration

  parse_results: ->
    @failed_steps = []
    @pending_steps = []
    for result in @results
      @pending_steps.push result if result.pending
      @failed_steps.push result if result.failed

  set_status: ->
    if @failed_steps.length then @status = 'failed'
    else if @pending_steps.length then @status = 'pending'
    else @status = 'passed'

  report_test: ->
    @total.tests++
    @total[@status]++
    console.log @icons[@status] + @name + ' (' + @duration + 'ms)'

  report_unsuccessful_steps: ->
    for result in @pending_steps
      console.log '     ' + result.step + ': pending'
    for result in @failed_steps
      console.log '     ' + result.step + ': ' + result.message

  totals: ->
    @empty_line()
    console.log(
      @total.tests + ' tests, ' +
      @total.passed + ' passed, ' +
      @total.failed + ' failed, ' +
      @total.pending + ' pending ' +
      '(' + @total.time / 1000 + 's)'
    )

  empty_line: -> console.log ' '
