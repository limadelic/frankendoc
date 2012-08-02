{ Textual } = require '../../src/textual'

global.run = (test) ->
  new Textual().run test

global.test = (test) ->
  verify_all_passed run test
