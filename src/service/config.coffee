require './../settings'

textual.configure ->
  textual.use express.bodyParser()

# load controllers
require './root'
require './runner/controller'

