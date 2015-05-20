class HeaderController

  #
  #
  #
  constructor: (@$scope, @PlacesService, @$interval) -> 
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
    @PlacesService.setPlaces()
    @

HeaderController.dependencies = [
  '$scope'
  'PlacesService'
  '$interval'
]

module.exports = HeaderController