{ Stats } = require './stats'

class @Report

  constructor: ->
    @empty_line()
    @stats = new Stats

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
    @stats.start()

  stop: (@results) ->
    return unless @results.length
    @status = @stats.stop @results
    @report_doc()
    @report_unsuccessful_steps()

  report_doc: ->
    console.log @color @icons[@status] + @name + ' (' + @stats.duration + 'ms)'

  report_unsuccessful_steps: ->
    for result in @results when not result.passed
      console.log '     ' + result.step + ': ' + (result.message ? 'pending')

  totals: ->
    @empty_line()
    console.log(
      @stats.docs + ' docs, ' +
      @stats.passed + ' passed, ' +
      @stats.failed + ' failed, ' +
      @stats.pending + ' pending ' +
      '(' + @stats.time / 1000 + 's)'
    )

  empty_line: -> console.log ' '
