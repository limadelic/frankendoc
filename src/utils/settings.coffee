fs = require 'fs'
path = require 'path'

require '../settings'

split_docs_root_and_type = ->
  ext = path.extname settings.docs.root
  if ext.length
    settings.docs.root = path.dirname settings.docs.root
    settings.docs.type = ext

user_settings_file = -> path.join settings.docs.root, 'settings.coffee'

merge_user_settings = ->
  user_settings_file()
  return unless fs.existsSync user_settings_file()
  user_settings = require(user_settings_file()).settings
  #console.log user_settings

@load = ->
  split_docs_root_and_type()
  merge_user_settings()
