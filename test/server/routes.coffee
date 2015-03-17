request = require 'supertest'

describe 'Routing', ->
  url = 'localhost:3000'

  before (done) ->
    done()
    
  describe 'guido single page base url', ->
    it 'should return status 200', (done) ->
      request(url).get('/').expect(200, done)
    
  describe 'JSON index for places', ->
    it 'should return places with category, title and describtion', (done) ->
      request(url).get('/places.json').end (err, res) ->
        if err
          throw err
        res.body[1].should.have.property('category')
        res.body[1].should.have.property('title')
        res.body[1].should.have.property('describtion')
        done()