class MapController

  mapStyles: [
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

  #
  #
  #
  constructor: (@$scope, @PlacesService, uiGmapGoogleMapApi, uiGmapIsReady, infoWindowFactory) ->
    uiGmapGoogleMapApi.then (@mapsApi) =>
      northeastBound = new mapsApi.LatLng(48.061550, 11.360840)
      southwestBound = new mapsApi.LatLng(48.248199, 11.722910)
      @allowedBounds = new mapsApi.LatLngBounds(northeastBound, southwestBound)

    uiGmapIsReady.promise().then( (mapInstances) =>
      @map =  mapInstances[0].map
      return infoWindowFactory)
    .then (InfoWindow) =>
      @infoWindow = new InfoWindow(@map)

    @initScope()
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
        minZoom:            11
        styles:             @mapStyles
      events:
        # limits panning of map to allowedBounds
        center_changed: (map) =>
          if @allowedBounds.contains map.center
            @lastValidCenter = map.getCenter()
          map.panTo @lastValidCenter

    @$scope.$watch (=> @PlacesService.places), (places) =>
      console.log places
      angular.forEach places, (place) =>
        place.click = @clickMarker
      @$scope.markers = places
    @        

  clickMarker: (marker) =>
    place = marker.model
    place.location.gmapLatLng = new @mapsApi.LatLng(place.location.latitude, place.location.longitude)

    @infoWindow.setPlace place
    @ 

MapController.dependencies = [
  '$scope'
  'PlacesService'
  'uiGmapGoogleMapApi'
  'uiGmapIsReady'
  'infoWindowFactory' 
]

module.exports = MapController