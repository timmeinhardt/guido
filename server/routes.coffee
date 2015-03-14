'use strict'

setup = (app) ->
  app.get '/', (req, res) -> res.sendFile(__dirname + '/../public/index.html')


exports.setup = setup

