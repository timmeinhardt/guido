class HeaderController

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

HeaderController.dependencies = ['$scope']

module.exports = HeaderController