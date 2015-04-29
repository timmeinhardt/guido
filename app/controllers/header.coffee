class HeaderController

  #
  #
  #
  constructor: (@$scope, @places, @$interval) ->
    @title1 = "Guido"
    @title2 = "Munich"    
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
    , 1000
    
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