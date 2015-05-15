class HeaderController

  #
  #
  #
  constructor: (@$scope, @$interval) ->
    @title1 = "Guido"
    @title2 = "Munich"
    @_initScope()
    
    @

  #
  #
  #
  _initScope: =>
    @$scope.title = @title2
    @$interval =>
      if @$scope.title == @title1
        @$scope.title = @title2
      else
        @$scope.title = @title1
    , 1000

HeaderController.dependencies = [
  '$scope'
  '$interval'
]

module.exports = HeaderController