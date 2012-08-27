rest = require 'restler'
{ Docs } = require './docs' 

class @Reader

  read: ->
    return unless @root?
    @pending_docs = [ @root ]
    while @pending_docs.length
      doc = @pending_docs.shift()
      if doc.is_suite
      then @docs.add_suite doc.name
      else @sync.read_doc doc
    @docs

  read_doc: (id, done) ->
    uri = "#{@root_uri}/content/#{id}?expand=children"

    rest.get(uri, @options).on 'complete', (@data) =>
      @add_suite() if @has_children()
      @add_doc()
      @queue_children()
      done()

  add_suite: -> @pending_docs.unshift @docs.add_suite @data.title

  add_doc: -> @docs.add @data.title, @data.body.value
  
  has_children: -> @data.children.content.length

  queue_children: -> for child in @data.children.content
    @pending_docs.unshift child.id

  constructor: ->
    @docs = new Docs
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
