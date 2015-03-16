request = require('supertest')

describe 'Routing', ->
  url = 'localhost:3000'

  before (done) ->
    done()
    
  describe 'guido single page', ->
    it 'should return status 200', (done) ->
      request(url).get('/').end (err, res) ->
        if err
          throw err
        res.should.have.status 200
        done()