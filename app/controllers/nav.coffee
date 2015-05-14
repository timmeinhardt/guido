class NavController

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

    @$scope.categories = 
    [
      {
        title: 'Food'
      }
      {
        title: 'Materialism'
      }
      {
        title: 'Culture'
      }
      {
        title: 'Darkness'
      }
      {
        title: 'Escapism'
      }

    ]

    @$scope.updatePlaces = @updatePlaces

  updatePlaces: (category) =>
    @places.setPlaces category: category.title, true
    @

NavController.dependencies = [
  '$scope'
  'places'
]

module.exports = NavController