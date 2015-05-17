'use strict'

path  = require 'path'

placesController = require './controllers/places'

setup = (app) ->
  app.get '/', (req, res) -> 
    res.sendFile( path.resolve(__dirname + '/../public/index.html') )
  app.get '/admin', (req, res) -> 
    res.sendFile( path.resolve(__dirname + '/../public/index.html') )
  app.use '/places', placesController

exports.setup = setup

