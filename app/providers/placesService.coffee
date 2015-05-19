class PlacesService

  constructor: (@$resource) ->
    @resource = @$resource '/places/:_id'
    @setPlaces {}
    @

  #
  #
  #
  setPlaces: (query) =>
    places = @resource.query query, =>
      @places = places


PlacesService.dependencies = [
  '$resource'
]

module.exports = PlacesService