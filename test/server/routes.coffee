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
    
  describe 'places CRUD', ->
    it 'index should return places with category, title and description', (done) ->
      request(url).get('/places').end (err, res) ->
        if err
          throw err
        res.body[0].should.have.property('category')
        res.body[0].should.have.property('title')
        res.body[0].should.have.property('description')
        done()

    it 'index should return specific places if query is given', (done) ->
      request(url).get('/places').query(category: 'Darkness').end (err, res) ->
        if err
          throw err
        res.body[0].category.should.eql('Darkness')
        done()

    it 'index should return specific place if query has _id parameter', (done) ->
      request(url).get('/places').end (err, res) ->
        place = res.body[0]

        request(url).get('/places').query(_id: place._id).end (err, res) ->
          if err
            throw err
          res.body[0]._id.should.eql(place._id)
          done()

    it 'new should create place', (done) ->
      newPlace =
        category: "Darkness"
        title: "Kong"
        description: "Club am HBF"
        placeid: "ChIJS3Wt_Pl1nkcR8341u4oQ_Jk"

      request(url).post('/places').send(newPlace).end (err, res) ->
        if err
          throw err
        res.body.title.should.eql('Kong')
        done()
