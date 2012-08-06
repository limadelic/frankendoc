require 'fibrous'
Fiber = require 'fibers'

require './settings'
{ Files } = require './utils/files'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Report } = require './reports/console'
{ Classes } = require './utils/classes'

parser = new Parser
runner = new Runner
suts = new Classes
files = new Files
report = new Report

run = ->
  suts.load_from files.suts

  for test in files.tests
    sut = suts.new_instances()[0]
    steps = parser.parse test.content
    results = runner.run_steps sut, steps
    report.test test.name, results

  report.totals()

Fiber(run).run()

