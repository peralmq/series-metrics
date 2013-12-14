express  = require 'express'
controllers = require './controllers'
app = express()

app.configure ->
  app.set "port", process.env.PORT or 4000
  app.use express.json limit: '50mb'

app.get '/series/:serie', (req, res) ->
  controllers.show req.params.serie, res
app.put '/series/:serie', (req, res) ->
  res.json controllers.update req.params.serie, req.body
app.get '/series/:serie/metrics/:metric', (req, res) ->
  controllers.show_metric req.params.serie, req.params.metric, res

app.listen app.get('port'), ->
  console.log "Listening on port #{app.get('port')}"

