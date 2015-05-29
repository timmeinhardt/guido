class Module
  extend: (obj) ->
    for key, value of obj
      @[key] = value

    obj.extended?.apply(@)
    this

class InfoWindow extends Module

  width:  260
  height: 320
  yOffset: 50

  constructor: (uiGmapGoogleMapApi) ->
    uiGmapGoogleMapApi.then (@mapsApi) =>
      @extend new mapsApi.OverlayView
    @div    = null
    @place  = null
    @

  onAdd: ->
    div   = document.createElement 'div'
    h2    = document.createElement 'h2'
    img   = document.createElement 'img'
    p     = document.createElement 'p'
    a     = document.createElement 'a'

    div.className = 'infoWindow'
    h2.className  = 'infoWindowTitle'
    img.className = 'infoWindowImg'
    p.className   = 'infoWindowDescription'
    a.className   = 'infoWindowHomepage'

    div.style.width   = @width + 'px'
    div.style.height  = @height + 'px'

    div.appendChild h2
    div.appendChild img
    div.appendChild p
    div.appendChild a

    panes = @getPanes()
    panes.floatPane.appendChild div
    @div = div

  draw: ->
    if @place 
      overlayProjection = @getProjection()
      pixelLocation     = overlayProjection.fromLatLngToDivPixel @place.location.gmapLatLng

      @div.style.left    = pixelLocation.x - @width/2 + 'px'
      @div.style.top     = pixelLocation.y - @height - @yOffset + 'px'
      @div.firstChild.innerHTML       = @place.title
      @div.childNodes[1].src          = @place.images[0].normal
      @div.childNodes[2].innerHTML    = @place.description
      @div.childNodes[3].setAttribute 'href', '@place.homepage'
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
      place.location.gmapLatLng = new @mapsApi.LatLng(place.location.latitude, place.location.longitude)
      @place = place
      @map.setCenter @place.location.gmapLatLng
      @draw().show()

InfoWindow.dependencies = [
  'uiGmapGoogleMapApi'
]

module.exports = InfoWindow