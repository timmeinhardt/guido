'use strict'

Place = require './models/places'
path  = require 'path'

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
  }, {
    category: "Darkness"
    title: "Harry Klein"
    description: "Techno Techno Techno"
    placeid: "ChIJP_jir_d1nkcR-PLGT1VWAuE"
    images: [
      {
        normal: '/uploads/images/places/harry_klein.jpg'
      }
    ]
  }, {
    category: "Food"
    title: "Schnelle Liebe"
    description: "Burger Burger Burger"
    placeid: "ChIJlxEQyl7fnUcRF5mlsNNlnTk"
    images: [
      {
        normal: '/uploads/images/places/schnelle_liebe.jpg'
      }
    ]
  }, {
    category: "Escapism"
    title: "Flaucher"
    description: "Moon"
    placeid: "ChIJq2ptKj3fnUcRQDaV-KQlHQ8"
    images: [
      {
        normal: '/uploads/images/places/flaucher.jpg'
      }
    ]
  }, ->

setup = (app) ->
  app.get '/', (req, res) -> 
    res.sendFile( path.resolve(__dirname + '/../public/index.html') )
  app.get '/admin', (req, res) -> 
    res.sendFile( path.resolve(__dirname + '/../public/index.html') )
  app.get '/places.json', (req, res) ->
    query = req.query
    if query.hasOwnProperty '_id'
      Place.findById query._id, (err, place) ->
        if err 
          res.send err
        res.json [place]
    else
      Place.find {query},(err, places) ->
        if err 
          res.send err
        res.json places

exports.setup = setup

