request = require 'supertest'

describe 'Routing', ->
  url = 'localhost:3000'

  before (done) ->
    done()
    
  describe 'guido single page base url', ->
    it 'should return status 200', (done) ->
      request(url).get('/').expect(200, done)

  describe 'guido single page admin panel', ->
    it 'should return status 200', (done) ->
      request(url).get('/admin').expect(200, done)
    
  describe 'JSON index for places', ->
    it 'should return places with category, title and describtion', (done) ->
      request(url).get('/places.json').end (err, res) ->
        if err
          throw err
        res.body[0].should.have.property('category')
        res.body[0].should.have.property('title')
        res.body[0].should.have.property('description')
        done()

    it 'should return specific places if query is given', (done) ->
      request(url).get('/places.json').query(category: 'Darkness').end (err, res) ->
        if err
          throw err
        res.body[0].category.should.eql('Darkness')
        done()

    it 'should return specific place if query has _id parameter', (done) ->
      request(url).get('/places.json').end (err, res) ->
        place = res.body[0]

        request(url).get('/places.json').query(_id: place._id).end (err, res) ->
          if err
            throw err
          res.body[0]._id.should.eql(place._id)
          done()
