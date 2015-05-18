class HeaderController

  #
  #
  #
  constructor: (@$scope, @places, @$interval) -> 
    @initScope()
    @

  #
  #
  #
  initScope: =>
    @$interval =>
      @$scope.title = if @$scope.title == "Guido" then "Munich" else "Guido"
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