class PlacesController

  #
  #
  #
  constructor: (@$scope, @PlacesService) ->
    @initScope()
    @

  #
  #
  #
  initScope: ->
    @$scope.$watch (=> @PlacesService.places), (places) =>
      @$scope.places = places
    @

PlacesController.dependencies = [
  '$scope'
  'PlacesService'
]


module.exports = PlacesController