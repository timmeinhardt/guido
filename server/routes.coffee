'use strict'

Place = require './models/places'

Place.remove {}, ->
  Place.create {
    category: "Darkness"
    title: "Kong"
    description: "Club am HBF"
  }, {
    category: "Food"
    title: "Kismet"
    description: "Orient und O..."
  }, {
    category: "Materialism"
    title: "Harvest"
    description: "Moon"
  }, ->

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/places.json', (req, res) ->
    query = req.query
    Place.find {query},(err, places) ->
      if err 
        res.send err
      res.json places

exports.setup = setup

