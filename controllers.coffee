models = require './models'
stats = require './stats'

module.exports =
  show_metric: (serie, metric, callback) ->
    models.get serie, (data) ->
      callback
        metric: stats[metric] data

  show: (serie, callback) ->
    models.get serie, (data) ->
      o = {} #data: data
      for name, func of stats
        o[name] = func data
      callback(o)

  update: (serie, body) ->
    models.set serie, body.data

