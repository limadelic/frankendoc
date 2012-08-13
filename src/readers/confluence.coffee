rest = require 'restler'

class @Reader

  constructor: ->
    @docs = []
    @auth = 'Basic ' +
      new Buffer(settings.docs.user + ':' + settings.docs.pass).toString 'base64'
    @root_uri = "http://#{settings.docs.host}/confluence/rest/prototype/1"
    @os_auth = 'os_authType=basic'
    @search_uri = "#{@root_uri}/search/name?query=#{settings.docs.root}&#{@os_auth}"
    @options =
      headers:
        Authorization: @auth
        'Content-Type': 'application/json'

  read: ->
    rest.get(@search_uri, @options).on 'complete', (data) ->
      console.log data
