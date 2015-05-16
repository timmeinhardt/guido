class AdminPanelController

  #
  #
  #
  constructor: (@$scope, @places) ->
    @initScope()  
    @

  #
  #
  #
  initScope: ->
    @$scope.$watch (=> @places.places), (places) => 
      @$scope.places = places

AdminPanelController.dependencies = [
  '$scope'
  'places'
]

module.exports = AdminPanelController