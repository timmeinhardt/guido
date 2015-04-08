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
      
  #
  #
  #
  getPlaces: ->
    @places

PlacesService.dependencies = ['$http']

module.exports = PlacesService