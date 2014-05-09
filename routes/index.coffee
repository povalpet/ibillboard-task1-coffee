TrackRoute = require './track'

###*
 * Initialize route handlers
 * @param  {Object} model
 * @return {Object} created route handlers
###
create = (model) ->
  track = new TrackRoute model.redis,model.track
  return {
    track
  }

###*
 * Registering app routes
 * @param  {Object} app    express instance
 * @param  {Object} routes route handlers
###
registerRoutes = (app, routes) ->
  app.get '/track',routes.track.handleGet

exports.register = (app,model) ->
  routes = create model;
  registerRoutes app, routes;
