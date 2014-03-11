jQuery ($) ->
  ready = ->
    # For some reason the highlighted essay carousel isn't autoplaying
    # Trigger mouseout after it's ready to start the autoplaying
    carouselMouseout = ->
      $('#highlighted-essays').mouseout()
    setTimeout(carouselMouseout, 500)

  $(document).ready(ready)
  $(document).on('page:load', ready)
