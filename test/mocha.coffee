fs = require 'fs'
{exec} = require 'child_process'

getDirectoryFiles = (directory, callback) ->
  files = fs.readdirSync directory
  for file in files
    filePath = directory + '/' + file
    stats = fs.statSync filePath
    if stats.isFile()
      callback filePath
    if stats.isDirectory()
      getDirectoryFiles filePath, callback
  return

getTestFiles = ->
  files = ['test/init.coffee']
  getDirectoryFiles '.', (testFilePath) ->
    return if '_test.coffee' isnt testFilePath.slice -12
    filePath = testFilePath.slice(0, -12) + '.coffee'
    files.push testFilePath
  files

exports.run = (callback) ->
  testFiles = getTestFiles()

  command = "node node_modules/mocha/bin/mocha
    --compilers coffee:coffee-script/register
    --ui tdd
    --globals logger
    --colors
    #{testFiles.join ' '}
  "

  exec command, (err, stdout, stderr) ->
    console.log stdout
    console.error stderr if stderr
    callback err, stdout, stderr
