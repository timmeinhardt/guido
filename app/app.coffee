'use strict'

#
# Require vendor modules explicitly
#
window._ = require('lodash.compat')
io = require('socket.io')
require 'angular'
require 'angular-route'
require 'angular-google-maps'
require 'angular-resource'

#
# Initialize angularJS app module
#
app = angular.module 'App', [
  'ngRoute'
  'uiGmapgoogle-maps'
  'ngResource'
]

#
# Configure app module
#
app.config (uiGmapGoogleMapApiProvider) ->
  uiGmapGoogleMapApiProvider.configure
    key: 'AIzaSyDbW5dqnoeTjb1dETiDs-azrIPnZ9VrUSo'
    v: '3.17'
    libraries: 'geometry'

#
# Register angular components
#
app.controller 'HomeController',  require 'controllers/home'
app.controller 'PlacesController',  require 'controllers/places'
app.controller 'MapController',   require 'controllers/map'
app.controller 'NavController',   require 'controllers/nav'
app.controller 'HeaderController', require 'controllers/header'
app.controller 'FooterController', require 'controllers/footer'
app.controller 'AdminPanelController',  require 'controllers/adminPanel'


app.directive 'map', require 'directives/map'
app.directive 'places', require 'directives/places'
app.directive 'nav', require 'directives/nav'
app.directive 'header', require 'directives/header'
app.directive 'footer', require 'directives/footer'
app.directive 'adminPanel', require 'directives/adminPanel'

app.service 'PlacesService', require 'providers/placesService'
app.service 'InfoWindow', require 'providers/infoWindowService'

#
# Setup AngularJS routes
#
app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
    .when '/',
      controller: 'HomeController'
      template:   require 'templates'
    .when '/admin',
      controller: 'AdminPanelController'
      template: require 'templates/adminPanel'

#
# Callback for document ready
#
angular.element(document).ready ->
  angular.bootstrap document, ['App']

#
# Connect to socket server
#
socket = io.connect()

module.exports = app



