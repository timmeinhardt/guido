class PlacesService

  constructor: (@$resource) ->
    @resource = @$resource '/places/:_id'
    @setPlaces {}, true
    @

  #
  #
  #
  setPlaces: (query, setMapPlaces) =>
    @places = @resource.query query
    @mapPlaces = @places

PlacesService.dependencies = [
  '$resource'
]

module.exports = PlacesService