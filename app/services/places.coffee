places = ($http) ->

  #
  #
  #
  httpRequest = (url) ->
    $http.get(url)
      .error((data, status, headers, config) ->
        new Error("ERROR parsing #{url}", arguments)
      )
      .then((response) ->
        response.data
      )

  #
  #
  #
  @find =  ->
    httpRequest '/places.json'

  #
  #
  #
  @

module.exports = places