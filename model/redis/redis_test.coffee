RedisModel = require './redis'

describe 'Unit - RedisModel', ->
  instance = redisMock = null;

  beforeEach ->
    redisMock =
      increment: spy()
  beforeEach ->
    instance = new RedisModel redisMock
  it 'should be initialized', ->
    assert.instanceOf instance,RedisModel

  describe 'method save', ->
    value = callback = null
    beforeEach ->
      value = 10
      callback = ->
      instance.save value,callback
    it 'should be a function', ->
      assert.isFunction instance.save
    it 'should call redis.increment method', ->
      assert.isTrue redisMock.increment.called
    it 'should call redis.increment method with proper arguments', ->
      assert.isTrue redisMock.increment.calledWith ['count',value],callback

