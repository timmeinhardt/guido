nav = ->

  restrict: 'E'

  controller: require('controllers/nav')

  template: require('templates/nav')()

module.exports = nav