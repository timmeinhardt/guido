'use strict'

express 			= require 'express'
routes 				= require './routes'
bodyParser 		= require('body-parser')
errorhandler 	= require('errorhandler')

app 			= express()
server 		= require("http").Server(app)
io 				= require("socket.io")(server)

# Configuration
app.use bodyParser.json()
app.use express.static(__dirname + '/../public')

env = process.env.NODE_ENV || 'development'
if env == 'development'
  app.use errorhandler(dumpExceptions: true, showStack: true)  
if env == 'production'
  app.use errorhandler()
 
start = (port, callback)->
  routes.setup app
  port = port or process.env.PORT

  app.listen port, callback
  console.log 'Express server listening on port %d in %s mode', port, app.settings.env

#
# Socket action when client connects.
#
io.on "connection", (socket) ->
	console.log('Client is connected.')

exports.start = start
exports.app 	= app
