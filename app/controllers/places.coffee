class PlacesController

  #
  #
  #
  constructor: (@$scope, @places) ->
    @initScope()
    @

  #
  #
  #
  initScope: ->
    @$scope.$watch (=> @places.places), (places) => 
      @$scope.places = places
    @

PlacesController.dependencies = [
  '$scope'
  'places'
]


module.exports = PlacesController