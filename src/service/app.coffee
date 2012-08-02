global.express = require 'express'
global.app = express.createServer()

require './config'

app.listen settings.port

console.log settings.logo
