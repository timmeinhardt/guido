class AdminPanelController

  #
  #
  #
  constructor: (@$scope, @PlacesService) ->
    @initScope()
    @PlacesService.setPlaces()
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
    # TODO: correct error handling
    place.$save =>
      if place._id
        @$scope.places.push place
        @$scope.newPlace = {}

  removePlace: (place) =>
    remove = @PlacesService.resource.remove _id: place._id
    remove.$promise.then (place) =>
      @PlacesService.dropPlace place

AdminPanelController.dependencies = [
  '$scope'
  'PlacesService'
]

module.exports = AdminPanelController