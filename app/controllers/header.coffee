class HeaderController

  #
  #
  #
  constructor: (@$scope, @places, @$interval) ->
    @title1 = "Munich"
    @title2 = "Guido"    
    @initScope()
    @

  #
  #
  #
  initScope: =>
    @$scope.title = @title2
    @$interval =>
      if @$scope.title == @title1
        @$scope.title = @title2
      else
        @$scope.title = @title1
    , 1500
    
    @$scope.resetPlaces = @resetPlaces
    @

  #
  #
  #
  resetPlaces: =>
    @places.setPlaces {}, true
    @

HeaderController.dependencies = [
  '$scope'
  'places'
  '$interval'
]

module.exports = HeaderController