_ = require 'underscore'
redis = require 'redis'
client = redis.createClient()

module.exports =
  get: (key, callback) ->
    client.lrange key, 0, -1, (err, list) ->
      data = _.map list, parseFloat
      callback(data)

  set: (key, value) ->
    client.lpush key, value
    client.ltrim key, 0, 100000
