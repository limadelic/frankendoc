require 'fibrous'
Fiber = require 'fibers'

require './settings'
{ Files } = require './utils/files'
{ Classes } = require './utils/classes'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Report } = require './reports/console'

parser = new Parser
runner = new Runner
suts = new Classes
files = new Files
report = new Report

run = ->
  suts.load files.suts

  for test in files.tests
    steps = parser.parse test.content
    results = runner.run_steps suts.new(), steps
    report.test test.name, results

  report.totals()

Fiber(run).run()

