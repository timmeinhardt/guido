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

    @$scope.updatePlaces = @places.setPlaces

NavController.dependencies = ['$scope','nav','places']

module.exports = NavController