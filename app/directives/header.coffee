header = ->

  restrict: 'E'

  controller: 'HeaderController'

  template: require('templates/header')()

module.exports = header