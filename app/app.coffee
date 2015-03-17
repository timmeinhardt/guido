'use strict'

#
# Require vendor modules explicitly
#
io = require 'socket.io'
require 'angular'
require 'angular-route'

#
# Define AngularJS App Module
#
app = angular.module 'App', [
  'ngRoute'
]

#
# Register Components
#
app.controller 'HomeController', 		require 'controllers/home'
app.controller 'PlacesController', 	require 'controllers/places'

app.directive 'places', require 'directives/places'

app.service 'places', require 'services/places'

#
# Setup AngularJS routes
#
app.config [
  '$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        controller: 'HomeController'
        template:   require 'templates'
]

#
# Callback for document ready
#
angular.element(document).ready ->
  angular.bootstrap document, ['App']

# Connect to socket server.
socket = io.connect("http://localhost:3000")

module.exports = app



