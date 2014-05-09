RedisService = require './redis'

describe 'Unit - RedisService', ->
  instance = redisMock = null
  beforeEach ->
    redisMock =
      createClient: ->
        redisClientMock =
          send_command: spy()
    spy redisMock,'createClient'


  beforeEach ->
    instance = new RedisService redisMock

  it 'should be initialized',  ->
    assert.instanceOf instance,RedisService
  it 'should create redis client', ->
    assert.isObject instance.client

  describe 'method createClient',  ->
    it 'should be a function', ->
      assert.isFunction instance.createClient
    it 'should call createClient', ->
      assert.isTrue redisMock.createClient.called


  describe 'method increment', ->
    callback = value = null
    beforeEach ->
      value = ['count',10]
      callback =  ->
      instance.increment value,callback
    it 'should be a function', ->
      assert.isFunction instance.increment
    it 'should call redis client', ->
      assert.isTrue instance.client.send_command.called
    it 'should call redis with proper arguments', ->
      assert.isTrue instance.client.send_command.calledWith 'INCRBY',value,callback

