'use strict'

mongoose  = require 'mongoose'
Place     = require '../../../server/models/places'

describe 'Place', ->

  before (done) ->
    mongoose.connect 'mongodb://localhost/guido-test'
    done()

  after (done) ->
    mongoose.connection.db.dropDatabase()
    mongoose.connection.close()
    done()

  beforeEach (done) ->
    place = new Place
      category:     'Darkness'
      title:        'Kong'
      describtion:  'Club am HBF'

    place.save (err) ->
      if err
        throw err
      done()

  afterEach (done) ->
    Place.remove {}, ->
      done()
    
  it 'find a place by category', (done) ->
    Place.findOne { category: 'Darkness' }, (err, place) ->
      if err
        throw err
      place.category.should.eql('Darkness')
      done()