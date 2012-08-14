class @Report

  constructor: ->
    @empty_line()
    @total =
      docs: 0
      passed: 0
      failed: 0
      pending: 0
      time: 0

  icons:
    passed: ' √ '
    failed: ' x '
    pending: ' o '

  colors:
    passed: 92
    failed: 91
    pending: 93

  color: (text) -> '\u001b[' + @colors[@status] + 'm' + text + '\u001b[0m'

  start: (@name) ->
    @started = new Date

  stop: (@results) ->
    return unless @results.length
    @record_time()
    @set_status()
    @report_doc()
    @report_unsuccessful_steps()

  record_time: ->
    @duration = new Date - @started
    @total.time += @duration

  set_status: ->
    @status = 'passed'
    for result in @results when not result.passed
      return @status = 'failed' if result.failed
      @status = 'pending'

  report_doc: ->
    @total.docs++
    @total[@status]++
    console.log @color @icons[@status] + @name + ' (' + @duration + 'ms)'

  report_unsuccessful_steps: ->
    for result in @results when not result.passed
      console.log '     ' + result.step + ': ' + (result.message ? 'pending')

  totals: ->
    @empty_line()
    console.log(
      @total.docs + ' docs, ' +
      @total.passed + ' passed, ' +
      @total.failed + ' failed, ' +
      @total.pending + ' pending ' +
      '(' + @total.time / 1000 + 's)'
    )

  empty_line: -> console.log ' '
