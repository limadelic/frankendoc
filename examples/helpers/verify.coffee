global.should = require 'should'

global.verify_all_passed = (results) ->
  #  console.log results
  expect(passed).toEqual true for { passed } in results

global.verify_response = (request, code, end) ->
  request.on 'complete', (data, response) ->
    expect(response.statusCode).toEqual code, data
    end()
