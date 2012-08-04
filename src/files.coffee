fs = require 'fs'
{ join } = require 'path'

class @Files

  constructor: ->
    @tests = []
    @suts = []
    @find_files settings.tests_dir

  is_dir: (file) -> fs.statSync(file).isDirectory()
  is_test: (file) -> file.match /\.txt$/
  is_sut: (file) -> file.match /\.(js|coffee)/

  find_files: (dir) -> for file in fs.readdirSync dir
    file = join dir, file
    @find_files file if @is_dir file
    @tests.push file if @is_test file
    @suts.push file if @is_sut file
