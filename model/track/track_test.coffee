TrackModel = require './track'

describe 'Unit - TrackModel', ->
  instance = fsMock = null

  beforeEach ->
    fsMock =
      appendFile: spy()
  beforeEach ->
    instance = new TrackModel fsMock

  it 'should be initialized', ->
    assert.instanceOf instance,TrackModel

  describe 'method save', ->
    callback = data = null
    beforeEach ->
      callback = ->
      data =
        foo:'bar'
      instance.save 'filepath',data,callback
    it 'should be a function', ->
      assert.isFunction instance.save
    it 'should call fs.appendFile method',->
      assert.isTrue fsMock.appendFile.called
    it 'should call fs.appendFile with providet arguments', ->
      assert.isTrue fsMock.appendFile.calledWith 'filepath',JSON.stringify(data)+'\n',callback
