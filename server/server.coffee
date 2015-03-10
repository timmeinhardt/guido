'use strict'

express = require 'express'
app = express()
 
app.use(express.static './public')

exports.startServer = (port, path, callback) ->

	# Server setup.
	server 	= require("http").Server(app)
	io 			= require("socket.io")(server)
	server.listen port, callback
	console.log('Listening on port: ' + port)

	# Defining routes.
	app.get '/', (req, res) -> res.sendfile './public/index.html'

	#
	# Socket action when client connects.
	#
	io.on "connection", (socket) ->
		console.log('Client is connected.')

