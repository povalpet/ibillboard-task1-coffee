module.exports = class TrackModel
  constructor: (@fs)->

  save: (filepath,data,callback) =>
    @fs.appendFile filepath,JSON.stringify(data)+'\n',callback
