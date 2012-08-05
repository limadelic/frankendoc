require 'fibrous'
Fiber = require 'fibers'

require './settings'
{ Files } = require './utils/files'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Login } = require '../examples/fixtures/login'
{ Report } = require './reports/console'

parser = new Parser
runner = new Runner
sut = new Login
files = new Files
report = new Report

run = ->
  for test in files.tests
    steps = parser.parse test.content
    results = runner.run_steps sut, steps
    report.test test.name, results

  report.totals()

Fiber(run).run()

