module.exports = class RedisModel
  constructor: (@redis) ->

  ###*
   * Save value to redis, using provided service
   * @param  {int}   value    value, by which will be stored data incremented by
   * @param  {Function} callback
  ###
  save: (value,callback) =>
    @redis.increment ['count',value],callback
