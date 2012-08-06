fs = require 'fs'
path = require 'path'

class @Files

  constructor: ->
    @tests = []
    @suts = []
    @find_files settings.tests_dir

  is_dir: (file) -> fs.statSync(file).isDirectory()
  is_test: (file) -> file.match /\.txt$/
  is_sut: (file) -> file.match /\.(js|coffee)$/

  find_files: (dir) -> for file in fs.readdirSync dir
    file = path.join dir, file
    @find_files file if @is_dir file
    @add_test file if @is_test file
    @suts.push file if @is_sut file

  add_test: (file) -> @tests.push
    name: path.basename file, '.txt'
    content: fs.readFileSync file, 'utf8'

