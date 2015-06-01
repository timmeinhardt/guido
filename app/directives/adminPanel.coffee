backend = ->

  restrict: 'E'

  controller: 'AdminPanelController'

  template: require('templates/adminPanel')()

module.exports = backend