class HomeController

  #
  #
  #
  constructor: (@$scope) ->
    @title = "Guido"
    @initScope()
    @

  #
  #
  #
  initScope: ->
    @$scope.title       = @title
    @

HomeController.dependencies = ['$scope']

module.exports = HomeController