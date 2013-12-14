models = require './models'
stats = require './stats'

module.exports =
  show_metric: (serie, metric, res) ->
    models.get serie, (data) ->
      res.json
        metric: stats[metric] data

  show: (serie, res) ->
    models.get serie, (data) ->
      o = {} #data: data
      for name, func of stats
        o[name] = func data
      res.json o

  update: (serie, body) ->
    models.set serie, body.data
