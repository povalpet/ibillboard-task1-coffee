Logger = require './logger'
RedisService = require './redis'
redisNode = require 'redis'
###*
  Services factory
###
exports.create = create = ->

  logger = new Logger()
  redis = new RedisService redisNode
  return {
    logger
    redis
  }


