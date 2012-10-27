fs = require 'fs'
{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    $ 'coffee src/frank ' + args

  '@defaults =': (settings) ->
    settings_file = __dirname + '/../../src/settings.coffee'
    Files.verify_contains settings_file, settings

  '@settings =': (settings) ->
    settings_file = __dirname + '/../settings.coffee'
    Files.verify_contains settings_file, settings
