class MapController

  #
  #
  #
  constructor: (@$scope) ->
    @_initScope()

    @

  #
  #
  #
  _initScope: ->
    @$scope.map = 
      center:
        latitude: 45
        longitude: -73
      zoom: 12

MapController.dependencies = ['$scope']

module.exports = MapController