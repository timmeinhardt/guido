class PlacesController

  #
  #
  #
  constructor: (@$scope, @places) ->
    @subTitle = "hedonistic"
    @_initScope()

    @

  #
  #
  #
  _initScope: ->
    @$scope.subTitle   = @subTitle

    @places.find().then (data) =>
      @$scope.places = data

PlacesController.dependencies = ['$scope', 'places']

module.exports = PlacesController