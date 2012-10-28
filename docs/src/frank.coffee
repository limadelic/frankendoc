_ = require 'underscore'
{ $ } = require '../../src/utils/shell'

class @Frank

  '[>\$] frank @args': (args, output) ->
    $('coffee src/frank ' + args)
      .compact().should.include output.compact()

  '@defaults =': (settings) ->
    settings_file = __dirname + '/../../src/settings.coffee'
    Files.verify_contains settings_file, settings

  '@settings =': (settings) ->
    settings_file = __dirname + '/../settings.coffee'
    Files.verify_contains settings_file, settings

  String.prototype.compact = -> _
    .compact(
      @replace(/\r/g, '')
      .split('\n'))
    .join('\n')
