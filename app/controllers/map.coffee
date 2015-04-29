class MapController

  dropAnimation: 2

  #
  #
  #
  constructor: (@$scope, @places, uiGmapGoogleMapApi) ->
    @initScope()
    uiGmapGoogleMapApi.then (maps) =>
      @allowedBounds = new (maps.LatLngBounds)(
        new (maps.LatLng)(48.061550, 11.360840),
        new (maps.LatLng)(48.248199, 11.722910)
      )
    @

  #
  #
  #
  initScope: ->
    @$scope.map = 
      center:
        latitude:   48.1333
        longitude:  11.5667
      zoom: 13
      options:
        panControl:         false
        mapTypeControl:     false
        streetViewControl:  false
        minZoom: 11
        styles:             @style()
      events:
        center_changed: (map) =>
          if @allowedBounds.contains map.center
            @lastValidCenter = map.getCenter()
          map.panTo @lastValidCenter

    @$scope.$watch (=> @places.mapPlaces), (places) =>
      angular.forEach places, (place) =>
        place.click = @clickMarker
        place.options =
          animation: @dropAnimation
      @$scope.markers = places
        

  clickMarker: (marker) =>
    @places.setPlace marker.model._id

  style: ->
    [
      {
        'featureType': 'administrative.province'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'administrative.locality'
        'elementType': 'labels.text'
        'stylers': [
          { 'lightness': '-50' }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [
          { 'saturation': -100 }
          { 'lightness': 65 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'geometry.fill'
        'stylers': [
          { 'visibility': 'on' }
          { 'saturation': '0' }
          { 'hue': '#ff0000' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'labels.icon'
        'stylers': [ { 'visibility': 'simplified' } ]
      }
      {
        'featureType': 'poi'
        'elementType': 'all'
        'stylers': [
          { 'saturation': -100 }
          { 'lightness': 51 }
          { 'visibility': 'off' }
        ]
      }
      {
        'featureType': 'poi.government'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'simplified' } ]
      }
      {
        'featureType': 'poi.medical'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'simplified' } ]
      }
      {
        'featureType': 'road'
        'elementType': 'all'
        'stylers': [
          { 'saturation': '-100' }
          { 'lightness': '0' }
        ]
      }
      {
        'featureType': 'road'
        'elementType': 'labels.text'
        'stylers': [ { 'lightness': '0' } ]
      }
      {
        'featureType': 'road'
        'elementType': 'labels.icon'
        'stylers': [ 
          { 'lightness': '50' } 
          { 'visibility': 'off' }          
        ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'geometry.fill'
        'stylers': [ { 'color': '#95969a' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'labels'
        'stylers': [ { 'lightness': '0' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'labels.icon'
        'stylers': [
          { 'visibility': 'off' }
          { 'lightness': '0' }
        ]
      }
      {
        'featureType': 'road.highway.controlled_access'
        'elementType': 'geometry.fill'
        'stylers': [ { 'color': '#3c3c31' } ]
      }
      {
        'featureType': 'road.highway.controlled_access'
        'elementType': 'labels'
        'stylers': [ { 'lightness': '0' } ]
      }
      {
        'featureType': 'road.highway.controlled_access'
        'elementType': 'labels.icon'
        'stylers': [
          { 'lightness': '-10' }
          { 'saturation': '0' }
        ]
      }
      {
        'featureType': 'road.local'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'on' }
          { 'lightness': '41' }
          { 'saturation': '0' }
        ]
      }
      {
        'featureType': 'transit'
        'elementType': 'all'
        'stylers': [
          { 'saturation': -100 }
          { 'visibility': 'simplified' }
        ]
      }
      {
        'featureType': 'transit.line'
        'elementType': 'geometry.fill'
        'stylers': [ { 'lightness': '0' } ]
      }
      {
        'featureType': 'transit.station.bus'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'water'
        'elementType': 'geometry'
        'stylers': [ { 'color': '#dce6e6' } ]
      }
      {
        'featureType': 'water'
        'elementType': 'labels'
        'stylers': [
          { 'visibility': 'on' }
          { 'lightness': -25 }
          { 'saturation': -100 }
        ]
      }
      {
        'featureType': 'water'
        'elementType': 'labels.text'
        'stylers': [ { 'lightness': '50' } ]
      }
    ]

   


MapController.dependencies = [
  '$scope'
  'places'
  'uiGmapGoogleMapApi' 
]

module.exports = MapController