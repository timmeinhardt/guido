class AdminPanelController

  #
  #
  #
  constructor: (@$scope, @PlacesService) ->
    @initScope()  
    @

  #
  #
  #
  initScope: ->
    @$scope.$watch (=> @PlacesService.places), (places) => 
      @$scope.places = places
    @$scope.savePlace   = @savePlace
    @$scope.removePlace = @removePlace
    @
  
  savePlace: =>
    if !@$scope.newPlace or @$scope.newPlace.length < 1
        return
    place = new @PlacesService.resource(@$scope.newPlace)
    place.$save =>
      if place._id
        @$scope.places.push place
        @$scope.newPlace = {}

  removePlace: (place) =>
    @PlacesService.resource.remove _id: place._id, (place) =>
      #@$scope.places.splice index, 1

AdminPanelController.dependencies = [
  '$scope'
  'PlacesService'
]

module.exports = AdminPanelController