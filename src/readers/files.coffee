fs = require 'fs'
path = require 'path'

class @Files

  constructor: (opt) ->
    @[key] = value for key, value of opt

  is_dir: -> fs.statSync(@file).isDirectory()
  skip_dir: -> @file.match /node_modules$/

  read: (dir) -> 
    @start? dir

    for file in fs.readdirSync dir
      @read_file path.resolve dir, file
    
    @end? dir

  read_file: (@file) ->
    if @is_dir()
    then @read @file unless @skip_dir()
    else @found @file if @file.match @ext
