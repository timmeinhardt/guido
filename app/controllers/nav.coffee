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
    @$scope.categories = [
      'Food'
      'Materialism'
      'Culture'
      'Darkness'
      'Escapism'
    ]

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