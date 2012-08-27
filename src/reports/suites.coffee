class @Suites

  constructor: (@reporter) ->
    @suites = []

  report: (@suite) -> 
    if @suite.name isnt @current?.name
    then @start()
    else @finish()

  start: ->
    @reporter.start_suite @suite
    @suite.started = new Date
    @suites.push @current if @current?
    @current = @suite
  
  finish: -> 
    @current.duration = new Date() - @current.started
    @reporter.stop_suite @current
    @current = @suites.pop()
