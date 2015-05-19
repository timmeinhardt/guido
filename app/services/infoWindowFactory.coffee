infoWindowFactory = (uiGmapGoogleMapApi) ->
  uiGmapGoogleMapApi.then (maps) ->
    class InfoWindow extends maps.OverlayView

      width:  200
      height: 200
      yOffset: 50

      constructor: (map) ->
        @div    = null
        @place  = null
        @setMap map
        @

      onAdd: ->
        div   = document.createElement 'div'
        div2  = document.createElement 'div'

        div.className = 'infoWindow'

        div.style.width   = @width + 'px'
        div.style.height  = @height + 'px'

        div2.style.backgroundColor = 'red'
        div2.style.width  = '100px'
        div2.style.height = '100px'

        div.appendChild div2

        panes = @getPanes()
        panes.floatPane.appendChild div
        @div = div

      draw: ->
        if @place 
          overlayProjection = @getProjection()
          pixelLocation = overlayProjection.fromLatLngToDivPixel @place.location.gmapLatLng

          @div.style.left    = pixelLocation.x - @width/2 + 'px'
          @div.style.top     = pixelLocation.y - @height - @yOffset + 'px'
          @div.firstChild.innerHTML     = @place.title
        @

      hide: ->
        if @div
          @div.style.visibility = 'hidden'

      show: ->
        if @div
          @div.style.visibility = 'visible'

      toggle: ->
        if @div
          if @div.style.visibility == 'hidden'
            @show()
          else
            @hide()

      onRemove: ->
        @div.parentNode.removeChild @div
        @div = null

      setPlace: (place) ->
        if @place and place._id is @place._id
          @toggle()
        else
          @place = place
          @draw().show()

    return InfoWindow

module.exports = infoWindowFactory