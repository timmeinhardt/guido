class PlacesController

  #
  #
  #
  constructor: (@$scope) ->
    @subTitle = "hedonistic"
    @_initScope()
    
    @

  #
  #
  #
  _initScope: ->
    @$scope.subTitle       = @subTitle

PlacesController.dependencies = ['$scope']

module.exports = PlacesController