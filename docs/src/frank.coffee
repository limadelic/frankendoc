_ = require 'underscore'
{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    compact($ 'coffee src/frank ' + args)
      .should.include compact output

  '@defaults =': (settings) ->
    settings_file = __dirname + '/../../src/settings.coffee'
    Files.verify_contains settings_file, settings

  '@settings =': (settings) ->
    settings_file = __dirname + '/../settings.coffee'
    Files.verify_contains settings_file, settings

  compact = (string) -> _
    .compact(string
      .replace(/\r/g, '')
      .split('\n'))
    .join('\n')
