fs = require 'fs'
{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    $ 'coffee src/frank ' + args

  '@defaults =': (settings) ->
    defaults = fs.readFileSync __dirname + '/../../src/settings.coffee', 'UTF8'
    defaults.should.include settings

  '@settings =': (settings) ->
    actual_settings = fs.readFileSync __dirname + '/../settings.coffee', 'UTF8'
    actual_settings.should.include settings
