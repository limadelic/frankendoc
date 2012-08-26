class @Stats

  docs: 0
  passed: 0
  failed: 0
  pending: 0
  time: 0

  start: -> @started = new Date

  stop: (@results) ->
    @record_time()
    @set_status()
    @count()

  record_time: ->
    @duration = new Date - @started
    @time += @duration

  set_status: ->
    @status = 'passed'
    for result in @results when not result.passed
      return @status = 'failed' if result.failed
      @status = 'pending'

  messages: ->
    for result in @results when not result.passed
      result.step + ': ' + (result.message ? 'pending')

  count: ->
    @docs++
    @[@status]++
    @status
