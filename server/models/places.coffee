'use strict'

mongoose  = require 'mongoose'
request   = require 'request'
Schema    = mongoose.Schema

googlePlacesRequest=
  url: 'https://maps.googleapis.com/maps/api/place/details/json'
  qs:
    placeid:  ''
    key:      'AIzaSyDbW5dqnoeTjb1dETiDs-azrIPnZ9VrUSo'

placeSchema = new Schema
  category:     
    type: String
    required: true
  title:     
    type: String
    required: true
  description:     
    type: String
    required: true
  address:      String
  homepage:     String
  phone:        String
  placeid:      String
  location:
    latitude:     
      type: String
      required: true
    longitude:     
      type: String
      required: true
  images: [
    {
      normal: String
    }
  ]

placeSchema.pre 'validate', (next) ->
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

Place = mongoose.model 'Place', placeSchema
module.exports = Place