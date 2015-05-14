class PlacesService

  constructor: (@$http) ->
    @setPlaces {}, true
    @

  #
  #
  #
  setPlaces: (query, setMapPlaces) =>
    request = @$http.get '/places.json', params: query
    request.then (response) =>
      @places = response.data
      if setMapPlaces is true
        @mapPlaces = @places
    @

PlacesService.dependencies = ['$http']

module.exports = PlacesService