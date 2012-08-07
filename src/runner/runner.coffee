_ = require 'underscore'
{ MethodMatcher } = require './method_matcher'
result = require './result'

class @Runner

  constructor: ->
    @method_matcher = new MethodMatcher

  run_steps: (@suts, steps) ->
    try
      process.on 'uncaughtException', @exception

      @results = []
      @run_step step for step in steps
      @results

    finally
      process.removeListener 'uncaughtException', @exception

  run_step: (@step) ->

    return unless @is_defined()
    return @pending() unless @is_implemented()

    try

      if @is_async() then @sync.async_call() else @sync_call()

      @pass()
    catch e
      @fail e

  pending: -> @results.push result.pending @step, @method
  pass: -> @results.push result.passed @step
  fail: (e) -> @results.push result.failed @step, e

  exception: (e) => @done e

  is_defined: ->
    for sut in @suts
      @sut = sut
      @method = @method_matcher.match sut, @step.name
      return true if @method?
    false

  is_implemented: -> _.isFunction @method

  is_async: -> @method.length is @step.args.length + 1

  sync_call: -> @call @step.args

  async_call: (@done) -> @call @step.args.concat [@done]

  call: (args) -> @method.apply @sut, args

