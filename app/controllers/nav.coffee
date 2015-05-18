class NavController

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
    @places.setPlaces category: category, true
    @

NavController.dependencies = [
  '$scope'
  'places'
]

module.exports = NavController