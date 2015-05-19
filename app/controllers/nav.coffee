class NavController

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
    @$scope.categories = [
      'Food'
      'Materialism'
      'Culture'
      'Darkness'
      'Escapism'
    ]

    @$scope.updatePlaces = @updatePlaces
    @

  updatePlaces: (category) =>
    @PlacesService.setPlaces category: category
    @

NavController.dependencies = [
  '$scope'
  'PlacesService'
]

module.exports = NavController