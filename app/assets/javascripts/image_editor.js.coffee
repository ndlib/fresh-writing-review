jQuery ($) ->
  ready = ->
    $('.image_editor .image a.change').click (event) ->
      event.preventDefault()
      image = $(this).parents('.image')
      image.hide()
      image.siblings('.form').show()

    $('.image_editor button').click (event) ->
      event.preventDefault()
      form = $(this).parents('.form')
      form.hide()
      form.siblings('.image').show()

  $(document).ready(ready)
  $(document).on('page:load', ready)
