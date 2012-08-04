require './settings'
fs = require 'fs'

{ Parser } = require './parsers/parser'
{ Runner } = require './runner/runner'
{ Login } = require '../examples/fixtures/login'

class @Files

  constructor: ->
    @tests = @find_tests()
    @suts = @find_suts()

  find_files: (dir, ext) ->
    file for file in fs.readdirSync dir when file.match ///\.#{ext}$///

  find_tests: -> @find_files settings.tests_dir, 'txt'
  find_suts: -> @find_files settings.fixtures_dir, '(js|coffee)'

class @Textual

  constructor: ->
    @parser = new Parser
    @runner = new Runner
    @sut = new Login

  run: (test) ->
    @runner.run_steps @sut,
      @parser.parse test

files = new @Files
console.log files.tests
console.log files.suts
