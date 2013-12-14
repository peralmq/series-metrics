# series-metrics

RESTful series metrics

Post series, one tick at a time, and retrieve the series, or metrics from that series

## Endpoints

* `PUT series/:serie {data: 1.56}`
* `GET series/:serie` # All the metrics
* `GET series/:serie/metrics/:metric` # That particular metric

