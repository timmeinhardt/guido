'use strict'

mongoose  		= require 'mongoose'

express 			= require 'express'
routes 				= require './routes'
bodyParser 		= require 'body-parser'
errorhandler 	= require 'errorhandler'

app 			= express()
server 		= require("http").Server(app)
io 				= require("socket.io")(server)

# database
mongoose.connect 'mongodb://localhost/guido'

# Configuration
app.use bodyParser.json()
app.use express.static(__dirname + '/../public')
app.use '/uploads', express.static(__dirname + '/../uploads')

env = process.env.NODE_ENV || 'development'
if env == 'development'
  app.use errorhandler(dumpExceptions: true, showStack: true)  
if env == 'production'
  app.use errorhandler()

# Socket action when client connects.
io.on "connection", (socket) ->
	console.log('Client is connected.')
 
start = (port, callback)->
  routes.setup app
  port = port or process.env.PORT

  server.listen port, callback
  console.log 'Express server listening on port %d in %s mode', port, app.settings.env

exports.start = start
exports.app 	= app
