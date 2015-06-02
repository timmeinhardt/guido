class NavController

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
    @$scope.categories = @PlacesService.categories
    @$scope.showPlaces = @showPlaces
    @

  showPlaces: (category) =>
    @PlacesService.setPlaces category: category
    @InfoWindow.hide()
    @

NavController.dependencies = [
  '$scope'
  'PlacesService'
  'InfoWindow'
]

module.exports = NavController