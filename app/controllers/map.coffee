class MapController

  #
  #
  #
  constructor: (@$scope, @places) ->
    @_initScope()

    @

  #
  #
  #
  _initScope: ->
    @$scope.map = 
      center:
        latitude:   48.1333
        longitude:  11.5667
      zoom: 13

    @$scope.options =
      panControl:         false
      mapTypeControl:     false
      streetViewControl:  false
      styles: @style()

    @$scope.$watch (=> @places.mapPlaces), (places) =>
      angular.forEach places, (place) =>
        place.click = @updatePlaces
      @$scope.markers = places

  updatePlaces: (marker) =>
    @places.setPlaces _id: marker.model._id, false

  style: ->
    [
      {
        'featureType': 'administrative.locality'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#2c2e33' }
          { 'saturation': 7 }
          { 'lightness': 19 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#ffffff' }
          { 'saturation': -100 }
          { 'lightness': 100 }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'poi'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#ffffff' }
          { 'saturation': -100 }
          { 'lightness': 100 }
          { 'visibility': 'off' }
        ]
      }
      {
        'featureType': 'road'
        'elementType': 'geometry'
        'stylers': [
          { 'hue': '#bbc0c4' }
          { 'saturation': -93 }
          { 'lightness': 31 }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'road'
        'elementType': 'labels'
        'stylers': [
          { 'hue': '#bbc0c4' }
          { 'saturation': -93 }
          { 'lightness': 31 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'road.arterial'
        'elementType': 'labels'
        'stylers': [
          { 'hue': '#bbc0c4' }
          { 'saturation': -93 }
          { 'lightness': -2 }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'road.local'
        'elementType': 'geometry'
        'stylers': [
          { 'hue': '#e9ebed' }
          { 'saturation': -90 }
          { 'lightness': -8 }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'transit'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#e9ebed' }
          { 'saturation': 10 }
          { 'lightness': 69 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'water'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#e9ebed' }
          { 'saturation': -78 }
          { 'lightness': 67 }
          { 'visibility': 'simplified' }
        ]
      }
    ]

MapController.dependencies = [
  '$scope'
  'places' 
]

module.exports = MapController