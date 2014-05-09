request = require 'supertest'
express = require 'express'
TrackRoute = require './track'

describe 'Unit - TrackRoute', ->
  instance = redisMock = modelMock = app = null

  beforeEach ->
    redisMock =
      save: ->
    modelMock =
      save: ->

    spy redisMock,'save'
    spy modelMock,'save'

  beforeEach ->
    instance = new TrackRoute redisMock,modelMock

  it 'should have been initialized', ->
    assert.instanceOf instance,TrackRoute

  describe 'method handleGet', ->
    app = null
    beforeEach ->
      app = express()
      app.get '/track',instance.handleGet
    it 'shoud be a function', ->
      assert.isFunction instance.handleGet
    it 'should call redis.save method when count query defined', ->
      request(app)
        .get('/track?count=2')
        .end ->
          assert.isTrue redisMock.save.called
    it 'should not call redis.save method when count query not defined', ->
      request(app)
        .get('/track')
        .end ->
          assert.isFalse(redisMock.save.called);
    it 'should call redis.save method with proper data', ->
      request(app)
        .get('/track?count=2')
        .end ->
          assert.isTrue redisMock.save.calledWith 2
    it 'should model.save method',  ->
      request(app)
        .get('/track?count=2')
        .end ->
          assert.isTrue modelMock.save.called
    it 'should model.save method with query values',  ->
      request(app)
        .get('/track?count=2&foo=bar')
        .end ->
          assert.isTrue modelMock.save.calledWith __dirname+'/../../data/trackData.out',count:'2',foo:'bar'



