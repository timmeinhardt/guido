'use strict'

Place = require './models/places'

Place.remove {}, ->
  Place.create {
    category: "Darkness"
    title: "Kong"
    description: "Club am HBF"
    placeid: "ChIJS3Wt_Pl1nkcR8341u4oQ_Jk"
    images: [
      {
        normal: '/uploads/images/places/kong.jpg'
      }
    ]
  }, {
    category: "Food"
    title: "Kismet"
    description: "Orient und O..."
    placeid: "ChIJW8lJY_R1nkcRPhiet7xj6aw"
    images: [
      {
        normal: '/uploads/images/places/kismet.jpg'
      }
    ]
  }, {
    category: "Materialism"
    title: "Harvest"
    description: "Moon"
    placeid: "ChIJL6QKbel1nkcRn0jc3YNinr0"
    images: [
      {
        normal: '/uploads/images/places/harvest.jpg'
      }
    ]
  }, ->

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/admin', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/places.json', (req, res) ->
    query = req.query
    Place.find {query},(err, places) ->
      if err 
        res.send err
      res.json places

exports.setup = setup

