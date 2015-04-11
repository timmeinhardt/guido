'use strict'

Place = require './models/places'

Place.remove {}, ->
  Place.create {
    category: "Darkness"
    title: "Kong"
    description: "Club am HBF"
    images: [
      {
        normal: '/uploads/images/places/kong.jpg'
      }
    ]
  }, {
    category: "Food"
    title: "Kismet"
    description: "Orient und O..."
    images: [
      {
        normal: '/uploads/images/places/kismet.jpg'
      }
    ]
  }, {
    category: "Materialism"
    title: "Harvest"
    description: "Moon"
    images: [
      {
        normal: '/uploads/images/places/harvest.jpg'
      }
    ]
  }, ->

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/adminPanel', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/places.json', (req, res) ->
    query = req.query
    Place.find {query},(err, places) ->
      if err 
        res.send err
      res.json places

exports.setup = setup

