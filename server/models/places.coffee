'use strict'

mongoose    = require 'mongoose'
request     = require 'request'
categories  = require './categories'

googlePlacesRequest=
  url: 'https://maps.googleapis.com/maps/api/place/details/json'
  qs:
    placeid:  ''
    key:      'AIzaSyDbW5dqnoeTjb1dETiDs-azrIPnZ9VrUSo'

placeSchema = new mongoose.Schema
  category:     
    type: String
    required: true
    enum: categories
  title:     
    type: String
    required: true
  description:     
    type: String
    required: true
  address:      String
  homepage:     String
  phone:        String
  gPlaceId:     String
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
      thumb:  String
    }
  ]

placeSchema.pre 'validate', (next) ->
  if this.gPlaceId
    googlePlacesRequest.qs.placeid = this.gPlaceId
    request googlePlacesRequest, (err, resp, body) =>
      if err
        next()
      else
        bodyJSON = JSON.parse body
        location = bodyJSON.result.geometry.location
        
        this.location.latitude  = location.lat
        this.location.longitude = location.lng
        next()
  else
    next()

Place = mongoose.model 'Place', placeSchema

module.exports = Place