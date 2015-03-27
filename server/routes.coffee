'use strict'

Place = require './models/places'

Place.remove({})

Place.create(
  category: "Darkness"
  title: "Kong"
  description: "Club am HBF"
)
Place.create(
  category: "Food"
  title: "Kismet"
  description: "Orient und O..."
)
Place.create(
  category: "Materialism"
  title: "Harvest"
  description: "Moon"
)

place2 = new Place()
place3 = new Place()

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')
  app.get '/places.json', (req, res) -> 
    Place.find {},(err, places) ->
      if err 
        res.send err
      res.json places

exports.setup = setup

