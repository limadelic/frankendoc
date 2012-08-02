{ EngineService } = require '../service'

engine.post '/run', (req, res) ->
  service = new EngineService
  test = req.body.content

  res.send service.run test