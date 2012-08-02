http = require 'restler'

###
describe 'engine', ->

  it 'is running', (done) ->
    verify_response http.get(settings.engine_uri), 200, done

  it 'runs tests', (done) ->

    test =
      name: 'UserLogin'
      content: '''

        when an user logs in
        it should be greeted

      '''

    http.postJson(settings.engine_run, test).on 'complete', (data, res) ->
      verify_all_passed data
      done()

