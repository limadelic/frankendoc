require 'fibrous'
Fiber = require 'fibers'

settings = require './utils/settings'
{ Files } = require './utils/files'
{ Classes } = require './utils/classes'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Report } = require './reports/console'

class Frank
  
  constructor: ->
    @parser = new Parser
    @runner = new Runner
    @files = new Files
    @classes = new Classes
    @report = new Report

  run: ->
    settings.load()
    @files.load()
    @classes.load @files.code

    for doc in @files.docs
      steps = @parser.parse doc.content

      @report.start doc.name
      results = @runner.run_steps @classes.new(), steps
      @report.stop results

    @report.totals()

@frank = -> Fiber(-> new Frank().run()).run()

