places = ($http) ->

  #
  #
  #
  httpRequest = (url, query) ->
    $http.get(url, {params: query})
      .error((data, status, headers, config) ->
        new Error("ERROR parsing #{url}", arguments)
      )
      .then((response) ->
        response.data
      )

  #
  #
  #
  @find = (query)->
    httpRequest '/places.json', query

  #
  #
  #
  @

module.exports = places