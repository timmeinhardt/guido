class MapController

  #
  #
  #
  constructor: (@$scope) ->
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
      zoom: 10

    @$scope.options =
      panControl:         false
      mapTypeControl:     false
      streetViewControl:  false
      styles: @_style()

  _style: ->
    [
      {
        'featureType': 'administrative'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'on' }
          { 'lightness': 33 }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [ { 'color': '#f2e5d4' } ]
      }
      {
        'featureType': 'poi.park'
        'elementType': 'geometry'
        'stylers': [ { 'color': '#c5dac6' } ]
      }
      {
        'featureType': 'poi.park'
        'elementType': 'labels'
        'stylers': [
          { 'visibility': 'on' }
          { 'lightness': 20 }
        ]
      }
      {
        'featureType': 'road'
        'elementType': 'all'
        'stylers': [ { 'lightness': 20 } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'geometry'
        'stylers': [ { 'color': '#c5c6c6' } ]
      }
      {
        'featureType': 'road.arterial'
        'elementType': 'geometry'
        'stylers': [ { 'color': '#e4d7c6' } ]
      }
      {
        'featureType': 'road.local'
        'elementType': 'geometry'
        'stylers': [ { 'color': '#fbfaf7' } ]
      }
      {
        'featureType': 'water'
        'elementType': 'all'
        'stylers': [
          { 'visibility': 'on' }
          { 'color': '#acbcc9' }
        ]
      }
    ]

MapController.dependencies = ['$scope']

module.exports = MapController