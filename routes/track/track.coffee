module.exports = class TrackRoute
  constructor: (@redis,@trackModel) ->

  ###*
   * Middleware for GET /track request
   * @param  {Object}   req
   * @param  {Object}   res
   * @param  {Function} next
  ###
  handleGet: (req,res,next) =>
    if req.query.count
      @redis.save parseInt req.query.count, (err) ->
        console.log err
    @trackModel.save __dirname+'/../../data/trackData.out',req.query, (err) =>
      return next err if err

      res.send req.query
