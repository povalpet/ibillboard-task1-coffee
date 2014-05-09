module.exports = class TrackModel
  constructor: (@fs)->

  ###*
   * Saves provided data to provided file
   * @param  {Object}   data     [description]
   * @param  {Function} callback [description]
  ###
  save: (filepath,data,callback) =>
    @fs.appendFile filepath,JSON.stringify(data)+'\n',callback
