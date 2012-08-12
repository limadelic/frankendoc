fs = require 'fs'
path = require 'path'
_ = require 'underscore'

{ settings } = require '../settings'

@load = ->
  global.settings = settings
  set_defaults()
  merge_user_settings()

###
# Defaults
###

set_defaults = ->
  set_docs_defaults()
  set_code_defaults()

set_docs_defaults = ->
  ext = path.extname settings.docs.root
  if ext.length
    settings.docs.root = path.dirname settings.docs.root
    settings.docs.type = ext

set_code_defaults = ->
  settings.code = settings.code ? {}
  settings.code.root = settings.code.root ? settings.docs.root

###
# User settings
###

merge_user_settings = ->
  return unless has_user_settings() 
  merge settings, user_settings()

user_settings_file = -> path.join settings.docs.root, 'settings.coffee'
has_user_settings = -> fs.existsSync user_settings_file()
user_settings = -> require(user_settings_file()).settings

merge = (one, another) ->
  for property of another
    if _.isObject another[property] and one[property]?
      merge one[property], another[property]
    else
      one[property] = another[property]
