class PlacesService

  constructor: (@$http, @$filter) ->
    @setPlaces {}, true
    @

  #
  # 
  #
  setPlace: (_id) =>
    loadedPlace = @$filter('filter')(@places, {_id: _id})
    if loadedPlace.length > 0
      @places = loadedPlace
    else 
      @setPlaces _id: _id, false

  #
  #
  #
  setPlaces: (query, setMapPlaces) =>
    request = @$http.get '/places', params: query
    request.then (response) =>
      @places = response.data
      if setMapPlaces is true
        @mapPlaces = @places
    @

PlacesService.dependencies = [
  '$http'
  '$filter'
]

module.exports = PlacesService