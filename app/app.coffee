'use strict'

#
# Require vendor modules explicitly
#
io = require 'socket.io'
require 'angular'
require 'angular-route'

#
# Register Components
#

#
# Define AngularJS App Module
#
app = angular.module 'App', [
  'ngRoute'
]

#
# Setup AngularJS routes
#
app.config [
  '$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        controller: require 'controllers/guidoCtrl'
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



