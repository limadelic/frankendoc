{ Stats } = require './stats'
{ Suites } = require './suites'
_ = require 'underscore'

class @Report

  start: ->
    @stats = new Stats
    @suites = new Suites this

  suite: (it) -> @suites.report it

  start_suite: (suite) ->
    @report "SuiteStarted name='#{suite.name}'" 

  stop_suite: (suite) ->  
    @report "SuiteFinished name='#{suite.name}' duration='#{suite.duration}'" 
  
  running: (name) ->
    @name = @escape name
    @stats.start()
    @report "Started name='#{@name}'"
  
  finished: (@results) -> @[@stats.stop @results]()

  passed: -> @report "Finished name='#{@name}' duration='#{@stats.duration}'"
  failed: -> @report "Failed name='#{@name}' message='#{@message()}'"
  pending: -> @report "Ignored name='#{@name}' message='#{@message()}'"

  message: -> @escape @stats.messages().join '\n'

  stop: ->

  report: (message) ->
    console.log '##teamcity[test' + message + ']'

  escape: (s) -> s
    .replace(/\|/g, "||")
    .replace(/\n/g, "|n")
    .replace(/\r/g, "|r")
    .replace(/\[/g, "|[")
    .replace(/\]/g, "|]")
    .replace(/\u0085/g, "|x")
    .replace(/\u2028/g, "|l")
    .replace(/\u2029/g, "|p")
    .replace(/'/g, "|'")

