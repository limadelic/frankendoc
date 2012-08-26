{ Stats } = require './stats'
_ = require 'underscore'

class @Report

  suite_name: settings.name ? 'frankendoc'

  start: ->
    @stats = new Stats
    @report "SuiteStarted name='#{@suite_name}'" 

  running: (@name) ->
    @stats.start()
    @report "Started name='#{@name}'"
  
  finished: (@results) ->
    return unless @results.length
    @[@stats.stop @results]()

  passed: -> @report "Finished name='#{@name}' duration='#{@stats.duration}'"
  failed: -> @report "Failed name='#{@name}' message='#{@message()}'"
  pending: -> @report "Ignored name='#{@name}' message'#{@message()}'"

  message: -> _.escape @stats.messages().join '\n'

  stop: ->
    @report "SuiteFinished name='#{@suite_name}' duration='#{@stats.time}'" 

  report: (message) ->
    console.log '##teamcity[test' + message + ']'
