fs = require 'fs'
path = require 'path'
_ = require 'underscore'

{ defaults } = require '../settings'

usage = '''
  Usage: frank [docs] [options] 

  Docs: [docs.root\[docs.type]]

    shortcut to set root & type properties in settings.docs 

  Options: 

    these become settings properties
'''

optimist = require 'optimist'
argv = optimist.usage(usage).argv

optimist.showHelp()

@read = ->
  global.settings = {}
  merge settings, defaults
  set_root_folder()
  merge_user_settings()
  merge settings, argv

###
# Root Folder
###

set_root_folder = ->
  return unless argv._.length
  settings.docs.root = argv._[0]
  ext = path.extname settings.docs.root
  if ext.length
    settings.docs.root = path.dirname settings.docs.root
    settings.docs.type = ext
  settings.code.root = settings.docs.root

###
# User settings
###

merge_user_settings = ->
  return unless has_user_settings()
  merge settings, user_settings()

user_settings_file = -> path.resolve settings.docs.root, 'settings.coffee'
has_user_settings = -> fs.existsSync user_settings_file()
user_settings = -> require(user_settings_file()).settings

merge = (one, another) ->
  for property, value of another
    if is_object(value) and is_object(one[property])
      merge one[property], value
    else
      one[property] = value

is_object = (o) -> toString.call(o) is '[object Object]'
