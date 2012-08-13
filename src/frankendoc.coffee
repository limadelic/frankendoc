require 'fibrous'
Fiber = require 'fibers'

settings = require './readers/settings'
{ Files } = require './readers/files'
{ Classes } = require './readers/classes'
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

  read: ->
    settings.read()
    @files.read()
    @classes.read @files.code

  run:->
    @read()

    for doc in @files.docs
      steps = @parser.parse doc.content

      @report.start doc.name
      results = @runner.run_steps @classes.new(), steps
      @report.stop results

    @report.totals()

@frank = -> Fiber(-> new Frank().run()).run()

