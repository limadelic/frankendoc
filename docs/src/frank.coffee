{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    output = output.replace /\r/g, ''
    out = $ 'coffee src/frank ' + args
    out.should.include output

  '@defaults =': (settings) ->
    settings_file = __dirname + '/../../src/settings.coffee'
    Files.verify_contains settings_file, settings

  '@settings =': (settings) ->
    settings_file = __dirname + '/../settings.coffee'
    Files.verify_contains settings_file, settings
