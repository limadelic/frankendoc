require './settings'
{ Files } = require './utils/files'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Login } = require '../examples/fixtures/login'
{ report } = require './reports/console'

parser = new Parser
runner = new Runner
sut = new Login
files = new Files

for test in files.tests
  steps = parser.parse test.content
  results = runner.run_steps sut, steps
  report test.name, results
  return

