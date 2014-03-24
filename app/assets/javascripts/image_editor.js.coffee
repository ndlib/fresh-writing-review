jQuery ($) ->
  ready = ->
    $('.image_editor .image a.change').click (event) ->
      event.preventDefault()
      image = $(this).parents('.image')
      image.hide()
      image.siblings('.form').show()


  $(document).ready(ready)
  $(document).on('page:load', ready)
