class PlacesService

  constructor: (@$http) ->
    @setPlaces()
    @

  #
  #
  #
  setPlaces: (query) =>
    request = @$http.get '/places.json', {params: query}
    request.then (response) =>
      @places = response.data
    @

PlacesService.dependencies = ['$http']

module.exports = PlacesService