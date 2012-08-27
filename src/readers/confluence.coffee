rest = require 'restler'
{ Doc } = require './doc' 

class @Reader

  read: ->
    return unless @root?
    @pending_docs = [ @root ]
    while @pending_docs.length
      doc @pending_docs.shift()
      if doc.is_suite
        @docs.push doc
      else
        @sync.read_doc doc

  read_doc: (id, done) ->
    uri = "#{@root_uri}/content/#{id}?expand=children"

    rest.get(uri, @options).on 'complete', (data) =>
      children = @children data
      @add_suite data if children.length
      @add_doc data
      @pending_docs.unshift children
      done()

  add_suite: (data) -> @pending_docs.unshift @docs.push 
    name: data.title
    is_suite: true

  add_doc: (data) -> @docs.push
    name: data.title    
    steps: @doc.read data.body.value
  
  children: (data) -> child.id for child in data.children.content

  constructor: ->
    @docs = []
    
    @doc = new Doc
      line_break: '\n'
      code_block: /ac:name="code".*?CDATA\[([\s\S]*?)\]\]><\//g 

    @read_settings()
    @root_uri = "http://#{@host}/rest/prototype/1"
    
    @auth = 'Basic ' + @encode64 @user + ':' + @pass
    
    @options =
      headers:
        authorization: @auth
        accept: 'application/json'

  read_settings: -> @[setting] = value for setting, value of settings.docs

  encode64: (string) -> new Buffer(string).toString 'base64'
