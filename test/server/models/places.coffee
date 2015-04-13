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
      description:  'Club am HBF'
      placeid:      'ChIJS3Wt_Pl1nkcR8341u4oQ_Jk'

    place.save (err) ->
      if err
        throw err
      done()

  afterEach (done) ->
    Place.remove {}, ->
      done()
    
  it 'should find a place by category', (done) ->
    Place.findOne category: 'Darkness', (err, place) ->
      if err
        throw err
      place.category.should.eql 'Darkness'
      done()
    
  it 'should autofill location latitude and longitude via placeid', (done) ->
    Place.findOne placeid: {$ne:null}, (err, place) ->
      place.location.latitude.should.not.be.empty
      place.location.longitude.should.not.be.empty
      done()