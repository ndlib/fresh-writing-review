jQuery ($) ->
  ready = ->
    $(document).on 'scroll', ->
      scrollPosition = $(document).scrollTop()
      scrollReference = 440
      if scrollPosition >= scrollReference
        $(".follow").addClass "fixed"
        windoww = $(window).width()
        rightp = (windoww - 930) / 2
        $(".follow").css "right", rightp
        $(".top").css "display","block"
      else
        $(".follow").removeClass "fixed"
        $(".follow").addClass "abs"
        $(".follow").css "right", ""
        $(".top").css "display","none"
      return


  $(document).ready(ready)

  $('.title').css 'margin-top', ->
    -$(this).outerHeight()
