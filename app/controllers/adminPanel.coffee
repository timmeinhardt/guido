class AdminPanelController

  #
  #
  #
  constructor: (@$scope, @PlacesService) ->
    @PlacesService.setPlaces()
    @initScope()
    @

  #
  #
  #
  initScope: ->
    @$scope.categories = [
      'Food'
      'Materialism'
      'Culture'
      'Darkness'
      'Escapism'
    ]
      
    @$scope.$watch (=> @PlacesService.places), (places) => 
      @$scope.places = places
      
    @$scope.savePlace   = @savePlace
    @$scope.removePlace = @removePlace
    @$scope.editPlace   = @editPlace
    @
  
  # TODO: correct error handling
  savePlace: =>
    place = @$scope.formPlace
    if place._id
      @PlacesService.resource.update _id: place._id, place
    else
      place = new @PlacesService.resource(place)

      place.$save =>
        @$scope.places.push place
        @$scope.formPlace = {}

  # TODO: correct error handling
  removePlace: (place) =>
    remove = @PlacesService.resource.remove _id: place._id
    remove.$promise.then (place) =>
      @PlacesService.dropPlace place

  editPlace: (place) =>
    @$scope.formPlace = place

AdminPanelController.dependencies = [
  '$scope'
  'PlacesService'
  'NavController'
]

module.exports = AdminPanelController