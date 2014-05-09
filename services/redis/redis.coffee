module.exports = class RedisService
  constructor: (@connector) ->
    @client = @createClient()

  ###*
   * Establish connection to Redis
   * @param  {int} port    port to use, default 6379
   * @param  {String} host    host to use, default 127.0.0.1
   * @param  {Object} options [description]
   * @return {Redis.Client}
  ###
  createClient: (port = 6379, host = '127.0.0.1', options) ->
    client = @connector.createClient port, host, options

  ###*
   * Send INCRBY command to redis, for more see http://redis.io/commands/incrby
   * @param  {Array}   value to be incemented
  ###
  increment: (value, callback) =>
    @client.send_command 'INCRBY',value,callback
