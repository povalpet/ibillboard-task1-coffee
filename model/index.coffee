fs = require 'fs'
TrackModel = require './track'
RedisModel = require './redis'

module.exports = factory = ({redis})->
  track = new TrackModel fs
  redis = new RedisModel redis
  return {
    track
    redis
  }
