rest = require 'restler'
{ Parser } = require '../parsers/parser' 

class @Reader

  read: ->
    return unless @root?
    @pending_docs = [ @root ]
    while @pending_docs.length
      @sync.read_doc @pending_docs.shift()

  read_doc: (id, done) ->
    uri = "#{@root_uri}/content/#{id}?expand=children"

    rest.get(uri, @options).on 'complete', (data) =>
      @add_doc data
      @pending_docs.push child.id for child in data.children.content
      done()

  add_doc: (data) -> @docs.push
    name: data.title    
    steps: @parser.parse data.body.value

  constructor: ->
    @docs = []
    
    @parser = new Parser
      line_break: '\n'
      code_block: /ac:name="code".*?CDATA\[([\s\S]*?)\]\]><\//g 

    @read_settings()
    @root_uri = "http://#{@host}/rest/prototype/1"
    
    @auth = 'Basic ' + @encode64 @user + ':' + @pass
    
    @options =
      headers:
        authorization: @auth
        accept: 'application/json'

  read_settings: -> for setting of settings.docs
    @[setting] = settings.docs[setting]

  encode64: (string) -> new Buffer(string).toString 'base64'
