express = require 'express'
http = require 'http'
servicesFactory = require './services'


app = express()
app.set 'mode',process.env.NODE_ENV || 'development'
app.set 'port',process.env.PORT || 3000

services = servicesFactory.create()
global.logger = services.logger

onServerError = (err) ->
  if 'EADDRINUSE' is err.errno
    logger?.error "Port #{app.get('port')} is already in use! Start aborted."
  else
    logger?.error 'LAUNCH ERROR'
    logger?.error err

server = http.createServer app
server.on 'error', onServerError
server.listen process.env.PORT || app.get('port'), ->
  logger?.info "Express server listening on port #{app.get('port')}"

