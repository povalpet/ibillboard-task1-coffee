module.exports = class RedisService
  constructor: (@connector) ->
    @client = @createClient()

  createClient: (port = 6379, host = '127.0.0.1', options) ->
    client = @connector.createClient port, host, options

  increment: (value, callback) =>
    @client.send_command 'INCRBY',value,callback
