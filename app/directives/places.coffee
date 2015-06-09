places = ->

  restrict: 'E'

  controller: require('controllers/places')

  template: require('templates/places')()

module.exports = places