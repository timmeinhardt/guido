'use strict'

mongoose  = require 'mongoose'
request   = require 'request'
Schema    = mongoose.Schema

googlePlacesRequest=
  url: 'https://maps.googleapis.com/maps/api/place/details/json'
  qs:
    placeid:  ''
    key:      'AIzaSyDbW5dqnoeTjb1dETiDs-azrIPnZ9VrUSo'

Place = new Schema
  category:     String
  title:        String
  description:  String
  address:      String
  homepage:     String
  phone:        String
  placeid:      String
  location:
    latitude:        String
    longitude:       String
  images: [
    {
      normal: String
    }
  ]

Place.pre 'save', (next) ->
  if this.placeid
    googlePlacesRequest.qs.placeid = this.placeid
    request googlePlacesRequest, (err, resp, body) =>
      bodyJSON = JSON.parse body
      location = bodyJSON.result.geometry.location
      
      this.location.latitude  = location.lat
      this.location.longitude = location.lng
      next()
  else
    next()

module.exports = mongoose.model 'Place', Place