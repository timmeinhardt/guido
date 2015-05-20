class PlacesService

  constructor: ($resource) ->
    @resource = $resource '/places/:_id'
    @places = []
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