fs = require 'fs'
{ $ } = require '../utils/shell'
docs = require './docs'

@read = -> new Github().read()

class Github

  constructor: ->
    settings.docs.root = settings.docs.repo.match(/.*\/(.*)?.git$/)[1]
  
  read: ->
    @clone()
    try docs.read()
    finally @cleanup()

  clone: -> $ 'git clone ' + settings.docs.repo
  
  cleanup: -> $ @rmdir() + settings.docs.root
  
  rmdir: -> if @windows() then 'rd /s /q ' else 'rm -r -f '
  
  windows: -> process.platform[0..2] is 'win'
