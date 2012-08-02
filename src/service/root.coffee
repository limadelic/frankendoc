app.get '/', (req, res) ->
  res.send "<pre>#{settings.logo}</pre>"
