{ MethodMatcher } = require './method_matcher'
{ Result } = require './result'

class @Runner

  constructor: ->
    @method_matcher = new MethodMatcher
    @result = new Result

  run_steps: (@suts, steps) ->
    try
      process.on 'uncaughtException', @exception

      @run_step step for step in steps

    finally
      process.removeListener 'uncaughtException', @exception

  run_step: (@step) ->

    return @missing() unless @is_implemented()?

    try

      if @is_async() then @sync.async_call() else @sync_call()

      @pass()
    catch e
      @fail e

  missing: -> @result.missing @step
  pass: -> @result.passed @step
  fail: (e) -> @result.failed @step, e

  exception: (e) => @done e

  is_implemented: ->
    for sut in @suts
      @sut = sut
      @method = @method_matcher.match sut, @step.name
      return true if @method?
    false


  is_async: -> @method.length is @step.args.length + 1

  sync_call: -> @call @step.args

  async_call: (@done) -> @call @step.args.concat [@done]

  call: (args) -> @method.apply @sut, args

