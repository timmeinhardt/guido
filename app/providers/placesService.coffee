class PlacesService

  constructor: ($resource) ->
    @resource = $resource '/places/:_id', null, 'update': method: 'PUT'
    @places = []
    @

  #
  #
  #
  setPlaces: (query = {}, select = '') =>
    places = @resource.query query, =>
      @places = places

  #
  #
  #
  dropPlace: (place) =>
    angular.forEach @places, (p, i) =>
      if p._id is place._id
        @places.splice(i, 1);

PlacesService.dependencies = [
  '$resource'
]

module.exports = PlacesService