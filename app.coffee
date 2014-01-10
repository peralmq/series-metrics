express  = require 'express'
controllers = require './controllers'
app = express()

app.configure ->
  app.set "port", process.env.PORT or 4000
  app.use express.json limit: '50mb'

app.get '/series/:serie', (request, response) ->
  controllers.show request.params.serie, (result) -> response.json result
app.put '/series/:serie', (request, response) ->
  response.json controllers.update request.params.serie, request.body
app.get '/series/:serie/metrics/:metric', (request, response) ->
  controllers.show_metric request.params.serie, request.params.metric, (result) -> response.json result

app.listen app.get('port'), ->
  console.log "Listening on port #{app.get('port')}"

