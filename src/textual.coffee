require './settings'
{ Files } = require './files'
{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Login } = require '../examples/fixtures/login'

class @Textual

  constructor: ->
    @parser = new Parser
    @runner = new Runner
    @sut = new Login

  run: (test) ->
    @runner.run_steps @sut,
      @parser.parse test

files = new Files
console.log files.tests
console.log files.suts
