'use strict'

mongoose  = require 'mongoose'
Schema    = mongoose.Schema

Place = new Schema
  category: String
  title: String
  description: String

module.exports = mongoose.model 'Place', Place