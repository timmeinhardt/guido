'use strict'

Place   = require '../models/places'
express = require 'express'

router = express.Router()

router.get '/', (req, res) ->
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

router.post '/', (req, res) ->
  Place.create req.body, (err, place) ->
    if err
      res.send err
    res.json place

router.put '/:_id', (req, res) ->
  Place.findByIdAndUpdate req.params._id, req.body, (err, place) ->
    if err
      res.send err
    res.json place

router.delete '/:_id', (req, res) ->
  Place.findByIdAndRemove req.params._id, req.body, (err, place) ->
    if err
      res.send err
    res.json place

Place.remove {}, ->
  Place.create {
    category: "Darkness"
    title: "Kong"
    description: "Club am HBF"
    gPlaceId: "ChIJS3Wt_Pl1nkcR8341u4oQ_Jk"
    images: [
      {
        normal: '/uploads/images/places/kong.jpg'
      }
    ]
  }, {
    category: "Food"
    title: "Kismet"
    description: "Orient und O..."
    gPlaceId: "ChIJW8lJY_R1nkcRPhiet7xj6aw"
    images: [
      {
        normal: '/uploads/images/places/kismet.jpg'
      }
    ]
  }, {
    category: "Materialism"
    title: "Harvest"
    description: "Moon"
    gPlaceId: "ChIJL6QKbel1nkcRn0jc3YNinr0"
    images: [
      {
        normal: '/uploads/images/places/harvest.jpg'
      }
    ]
  }, {
    category: "Darkness"
    title: "Harry Klein"
    description: "Techno Techno Techno"
    gPlaceId: "ChIJP_jir_d1nkcR-PLGT1VWAuE"
    images: [
      {
        normal: '/uploads/images/places/harry_klein.jpg'
      }
    ]
  }, {
    category: "Food"
    title: "Schnelle Liebe"
    description: "Burger Burger Burger"
    gPlaceId: "ChIJlxEQyl7fnUcRF5mlsNNlnTk"
    images: [
      {
        normal: '/uploads/images/places/schnelle_liebe.jpg'
      }
    ]
  }, {
    category: "Escapism"
    title: "Flaucher"
    description: "Moon"
    gPlaceId: "ChIJq2ptKj3fnUcRQDaV-KQlHQ8"
    images: [
      {
        normal: '/uploads/images/places/flaucher.jpg'
      }
    ]
  }, ->

module.exports = router