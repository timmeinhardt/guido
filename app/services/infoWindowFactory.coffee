infoWindowFactory = (uiGmapGoogleMapApi) ->
  uiGmapGoogleMapApi.then (maps) ->
    class InfoWindow extends maps.OverlayView

      constructor: (map) ->
        @div    = null
        @place  = null
        @setMap map
        @

      onAdd: ->
        div = document.createElement 'div'
        div.style.visibility      = 'hidden'

        div.style.borderStyle     = 'none'
        div.style.borderWidth     = '0px'
        div.style.position        = 'absolute'
        div.style.backgroundColor = 'red'
        div.style.width   = '100px'
        div.style.height  = '100px'

        @div = div

        panes = @getPanes()
        panes.floatPane.appendChild div

      draw: ->
        if @place 
          overlayProjection = @getProjection()
          location = new window.google.maps.LatLng(@place.location.latitude, @place.location.longitude)
          pixelLocation = overlayProjection.fromLatLngToDivPixel location

          @div.style.left    = pixelLocation.x + 'px'
          @div.style.top     = pixelLocation.y + 'px'
          @div.innerHTML     = @place.title
          @show()
        @

      hide: ->
        if @div
          @div.style.visibility = 'hidden'

      show: ->
        if @div
          @div.style.visibility = 'visible'

      onRemove: ->
        @div.parentNode.removeChild @div
        @div = null

      setPlace: (place) ->
        if @place and place._id is @place._id
          @hide()
        else
          @place = place
          @draw()

    return InfoWindow

module.exports = infoWindowFactory