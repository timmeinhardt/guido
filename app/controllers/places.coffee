class PlacesController

  #
  #
  #
  constructor: (@$scope, @PlacesService, @InfoWindow) ->
    @initScope()
    @

  #
  #
  #
  initScope: ->
    @$scope.$watch (=> @PlacesService.places), (places) =>
      @$scope.places = places
    @$scope.showInfoWindow = @showInfoWindow
    @

  showInfoWindow: (place) =>
    @InfoWindow.setPlace place
    @

PlacesController.dependencies = [
  '$scope'
  'PlacesService'
  'InfoWindow'
]


module.exports = PlacesController