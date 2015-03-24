'use strict'

#
# Require vendor modules explicitly
#
window._ = require('lodash.compat')
io = require('socket.io')
require 'angular'
require 'angular-route'
require 'angular-google-maps'

#
# Define AngularJS App Module
#
app = angular.module 'App', [
  'ngRoute'
  'uiGmapgoogle-maps'
]

#
# Register Components
#
app.controller 'HomeController', 		require 'controllers/home'
app.controller 'PlacesController', 	require 'controllers/places'
app.controller 'MapController', 	require 'controllers/map'

app.directive 'map', require 'directives/map'
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
socket = io.connect()

module.exports = app



