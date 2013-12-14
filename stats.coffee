_ = require 'underscore'
fs = require 'fast-stats'

module.exports =
  max: (list) -> _.max list
  min: (list) -> _.min list
  mean: (list) -> new fs.Stats().push(list).amean()
  median: (list) -> new fs.Stats().push(list).median()
  p50: (list) -> new fs.Stats().push(list).percentile(50)
  p95: (list) -> new fs.Stats().push(list).percentile(95)
  p99: (list) -> new fs.Stats().push(list).percentile(99)
  stddev: (list) -> new fs.Stats().push(list).stddev()

