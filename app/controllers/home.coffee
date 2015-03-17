class HomeController

  #
  #
  #
  constructor: (@$scope) ->
    @title = "Guido"
    @_initScope()
    
    @

  #
  #
  #
  _initScope: ->
    @$scope.title       = @title

HomeController.dependencies = ['$scope']

module.exports = HomeController