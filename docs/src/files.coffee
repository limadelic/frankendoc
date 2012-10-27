fs = require 'fs'
should = require 'should'

class @Files
  
  'Read any file': (done) ->
    fs.readFile __filename, (err, data) ->
      should.exist data
      should.not.exist err
      done()

  'Verify @file contains @content': (file, content, done) ->
    fs.readFile file, 'utf8', (err, data) ->
      data.should.include content
      done()

  verify_contains: (file, content) ->
    fs.readFileSync(file, 'utf8').should.include content
