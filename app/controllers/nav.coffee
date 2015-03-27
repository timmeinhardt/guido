class NavController

  #
  #
  #
  constructor: (@$scope) ->  
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

    


NavController.dependencies = ['$scope','nav']

module.exports = NavController