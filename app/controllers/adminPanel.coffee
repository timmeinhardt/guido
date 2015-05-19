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
    @$scope.savePlace   = @savePlace
    @$scope.removePlace = @removePlace
    @
  
  savePlace: =>
    if !@$scope.newPlace or @$scope.newPlace.length < 1
        return
    place = new @places.resource(@$scope.newPlace)
    place.$save =>
      if place._id
        @$scope.places.push place
        @$scope.newPlace = {}

  removePlace: (place) =>
    @places.resource.remove _id: place._id, (place) =>
      #@$scope.places.splice index, 1

AdminPanelController.dependencies = [
  '$scope'
  'places'
]

module.exports = AdminPanelController