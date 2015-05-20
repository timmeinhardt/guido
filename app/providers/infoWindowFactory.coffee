infoWindowFactory = (uiGmapGoogleMapApi) ->
  uiGmapGoogleMapApi.then (maps) ->
    class InfoWindow extends maps.OverlayView

      width:  270
      height: 350
      yOffset: 50

      constructor: (map) ->
        @div    = null
        @place  = null
        @setMap map
        @

      onAdd: ->
        div   = document.createElement 'div'
        h2    = document.createElement 'h2'
        img   = document.createElement 'img'
        p     = document.createElement 'p'

        div.className = 'infoWindow'
        h2.className  = 'infoWindowTitle'
        img.className = 'infoWindowImg'
        p.className   = 'infoWindowDescription'

        div.style.width   = @width + 'px'
        div.style.height  = @height + 'px'

        div.appendChild h2
        div.appendChild img
        div.appendChild p

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
          @div.childNodes[1].src        = @place.images[0].normal
          @div.childNodes[2].innerHTML  = @place.description
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