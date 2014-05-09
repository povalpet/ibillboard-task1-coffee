winston = require 'winston'

module.exports = (filename) ->
  transports = [
    new winston.transports.Console
      timestamp: true
  ]

  if filename
    transports.push new winston.transports.File
      filename: filename
      timestamp: true

  new winston.Logger {transports}
