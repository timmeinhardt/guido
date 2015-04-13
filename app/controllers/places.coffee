class PlacesController

  #
  #
  #
  constructor: (@$scope, @places) ->
    @_initScope()

    @

  #
  #
  #
  _initScope: ->
    @$scope.$watch (=> 
      @places.getPlaces()
      ), (places) => 
      @$scope.places = places

PlacesController.dependencies = [
  '$scope'
  'places'
]


module.exports = PlacesController