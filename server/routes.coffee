'use strict'

Place = require './models/places'

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/places.json', (req, res) -> 
  	Place.find {},(err, places) ->
    	if err 
    		res.send err
    	res.json places

exports.setup = setup

