
Logger = require './logger'

###*
  Services factory
###
exports.create = create = ->

  logger = new Logger()

  return {
    logger
  }


