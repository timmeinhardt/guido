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
    @$scope.$watch (=> @places.places), (places) => 
      @$scope.places = places

PlacesController.dependencies = [
  '$scope'
  'places'
]


module.exports = PlacesController